import 'package:get/get.dart';
import 'package:movie/model/news_model.dart';
import 'package:movie/services/network.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;

  // Add toggle state variables
  var showAllTrending = false.obs;
  var showAllNewsForYou = false.obs;

  final NetworkAPICall _networkAPICall = NetworkAPICall();

  @override
  void onInit() {
    getTrendingNews();
    getNewsForYou();
    super.onInit();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    const String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=feac6772bf7143e1976d85e79fb8633a";
    try {
      var response = await _networkAPICall.get(url, isAddBaseUrl: true);
      var articles = response['articles'];
      trendingNewsList.clear();
      for (var news in articles) {
        trendingNewsList.add(NewsModel.fromJson(news));
      }
    } catch (e) {
      print("Error fetching trending news: $e");
    }
    isTrendingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    const String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=feac6772bf7143e1976d85e79fb8633a";
    try {
      var response = await _networkAPICall.get(url, isAddBaseUrl: true);
      var articles = response['articles'];
      newsForYouList.clear();
      for (var news in articles) {
        newsForYouList.add(NewsModel.fromJson(news));
      }
    } catch (e) {
      print("Error fetching news for you: $e");
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> searchNews(String search,
      {String country = "us", String category = "business"}) async {
    isNewsForYouLoading.value = true;
    String url =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&q=$search&apiKey=feac6772bf7143e1976d85e79fb8633a";
    try {
      var response = await _networkAPICall.get(url, isAddBaseUrl: true);
      var articles = response['articles'];
      newsForYouList.clear();
      for (int i = 0; i < articles.length && i < 10; i++) {
        newsForYouList.add(NewsModel.fromJson(articles[i]));
      }
    } catch (e) {
      print("Error searching news: $e");
    } finally {
      isNewsForYouLoading.value = false;
    }
  }

  // Toggle functions for "See All"
  void toggleShowAllTrending() {
    showAllTrending.value = !showAllTrending.value;
  }

  void toggleShowAllNewsForYou() {
    showAllNewsForYou.value = !showAllNewsForYou.value;
  }
}

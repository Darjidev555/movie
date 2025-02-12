import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie/controller/news_controller.dart';
import 'package:movie/widget/commantextwidget.dart';
import 'package:movie/widget/newsdetails.dart';
import 'package:movie/widget/newstile.dart';
import 'package:movie/widget/trandingcard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NewsController newsController = Get.put(NewsController());

  String formatDate(DateTime? date) {
    if (date == null) {
      return "Unknown Date";
    }
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void _onScroll() {
    if (newsController.scrollController.position.pixels >=
        newsController.scrollController.position.maxScrollExtent - 20) {
      // Load more news when the user scrolls near the bottom
      if (!newsController.isNewsForYouMoreLoading.value) {
        newsController.getNewsForYou(loadMore: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    newsController.scrollController.addListener(_onScroll);

    return RefreshIndicator(
      onRefresh: () async {
        newsController.getTrendingNews();
        newsController.getNewsForYou();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.black54,
          title: const CommonTextWidget(
            text: "News App",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black54,
        body: ListView(
          controller: newsController.scrollController,
          padding: const EdgeInsets.all(10.0),
          children: [
            // Trending News
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonTextWidget(
                  text: "Hottest News",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: Obx(() => newsController.isTrendingLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsController.trendingNewsList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < newsController.trendingNewsList.length) {
                          var e = newsController.trendingNewsList[index];
                          return Trandingcard(
                            ontap: () {
                              Get.to(Newsdeatils(newsModel: e));
                            },
                            imageUrl: e.urlToImage!,
                            tag: "Trending No ${index + 1}",
                            title: e.title!,
                            author: e.author!,
                            time: formatDate(e.publishedAt),
                          );
                        } else {
                          return newsController.isTrendingMoreLoading.value
                              ? const CircularProgressIndicator()
                              : const SizedBox();
                        }
                      },
                    )),
            ),
            const SizedBox(height: 15),

            // News For You
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonTextWidget(
                  text: "News For You",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (newsController.isNewsForYouLoading.value &&
                  newsController.newsForYouList.isEmpty) {
                // Show full-page loader only for the first load
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: newsController.newsForYouList.length + 1,
                itemBuilder: (context, index) {
                  if (index < newsController.newsForYouList.length) {
                    var e = newsController.newsForYouList[index];
                    return Newstile(
                      ontap: () {
                        Get.to(Newsdeatils(newsModel: e));
                      },
                      title: e.title!,
                      author: e.author ?? "Unknown",
                      time: formatDate(e.publishedAt),
                      imageUrl: e.urlToImage ??
                          "https://www.hindustantimes.com/ht-img/img/2024/10/07/550x309/Prime-Minister-Narendra-Modi-and-Maldives-Presiden_1728317636195_1728317752751.jpg",
                    );
                  } else {
                    // Show small loading indicator at the bottom when fetching more news
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(),
                    ));
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

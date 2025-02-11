import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        newsController.getNewsForYou();
        newsController.getTrendingNews();
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CommonTextWidget(
                      text: "Hottest News",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            newsController.toggleShowAllTrending();
                          },
                          child: CommonTextWidget(
                            text: newsController.showAllTrending.value
                                ? "Show Less"
                                : "See All",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => newsController.isTrendingLoading.value
                      ? const CircularProgressIndicator()
                      : Row(
                          children: newsController.trendingNewsList
                              .take(newsController.showAllTrending.value
                                  ? newsController.trendingNewsList.length
                                  : 4)
                              .map((e) => Trandingcard(
                                    ontap: () {
                                      Get.to(Newsdeatils(newsModel: e));
                                    },
                                    imageUrl: e.urlToImage!,
                                    tag: "Trending No 1",
                                    title: e.title!,
                                    author: e.author!,
                                    time: formatDate(e.publishedAt),
                                  ))
                              .toList(),
                        )),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CommonTextWidget(
                      text: "News For You",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            newsController.toggleShowAllNewsForYou();
                          },
                          child: CommonTextWidget(
                            text: newsController.showAllNewsForYou.value
                                ? "Show Less"
                                : "See All",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(() => newsController.isNewsForYouLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        children: newsController.newsForYouList
                            .take(newsController.showAllNewsForYou.value
                                ? newsController.newsForYouList.length
                                : 4)
                            .map((e) => Newstile(
                                  ontap: () {
                                    Get.to(Newsdeatils(newsModel: e));
                                  },
                                  title: e.title!,
                                  author: e.author ?? "Unknown",
                                  time: formatDate(e.publishedAt),
                                  imageUrl: e.urlToImage ??
                                      "https://www.hindustantimes.com/ht-img/img/2024/10/07/550x309/Prime-Minister-Narendra-Modi-and-Maldives-Presiden_1728317636195_1728317752751.jpg",
                                ))
                            .toList(),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

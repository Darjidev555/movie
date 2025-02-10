import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:movie/controller/news_controller.dart';
import 'package:movie/widget/commantextwidget.dart';
import 'package:movie/widget/newsdetails.dart';
import 'package:movie/widget/newstile.dart';
import 'package:movie/widget/trandingcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String formatDate(DateTime? date) {
    if (date == null) {
      return "Unknown Date";
    }
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
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
      /*drawer: Customdrawer(),*/
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextWidget(
                    text: "Hottest News",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  CommonTextWidget(
                    text: "See all",
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => newsController.isTrendingLoading.value
                    ? const CircularProgressIndicator()
                    : Row(
                        children: newsController.trendingNewsList
                            .map((e) => Trandingcard(
                                ontap: () {
                                  Get.to(Newsdeatils(
                                    newsModel: e,
                                  ));
                                },
                                imageUrl: e.urlToImage!,
                                tag: "Trending No 1",
                                title: e.title!,
                                author: e.author!,
                                time: formatDate(e
                                    .publishedAt))) // Dynamic date from e.publishedAt
                            .toList(),
                      )),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextWidget(
                    text: "News For You",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  CommonTextWidget(
                    text: "See all",
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => newsController.isNewsForYouLoading.value
                  ? const CircularProgressIndicator()
                  : Column(
                      children: newsController.newsForYouList
                          .map((e) => Newstile(
                              ontap: () {
                                Get.to(Newsdeatils(newsModel: e));
                              },
                              title: e.title!,
                              author: e.author ?? "Unknown",
                              time: formatDate(e.publishedAt),
                              // Dynamic date from e.publishedAt
                              imageUrl: e.urlToImage ??
                                  "https://www.hindustantimes.com/ht-img/img/2024/10/07/550x309/Prime-Minister-Narendra-Modi-and-Maldives-Presiden_1728317636195_1728317752751.jpg"))
                          .toList(),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}

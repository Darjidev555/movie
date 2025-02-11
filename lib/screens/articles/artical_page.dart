import 'package:flutter/material.dart';
import 'package:movie/controller/news_controller.dart';
import 'package:movie/widget/newsdetails.dart';
import 'package:movie/widget/newstile.dart';
import 'package:movie/widget/serach_widget.dart';
import 'package:get/get.dart';

class Articalpage extends StatelessWidget {
  const Articalpage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return RefreshIndicator(
      onRefresh: () async {
        newsController.newsForYouList;
      },
      child: Scaffold(
          backgroundColor: Colors.black54,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const Searchwidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Column(
                      children: newsController.newsForYouList
                          .map((e) => Newstile(
                              ontap: () {
                                Get.to(Newsdeatils(newsModel: e));
                              },
                              title: e.title!,
                              author: e.author ?? "Unknown",
                              time: e.publishedAt.toString(),
                              imageUrl: e.urlToImage ??
                                  "https://www.hindustantimes.com/ht-img/img/2024/10/07/550x309/Prime-Minister-Narendra-Modi-and-Maldives-Presiden_1728317636195_1728317752751.jpg"))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

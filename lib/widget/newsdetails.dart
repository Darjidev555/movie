import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie/model/news_model.dart';

class Newsdeatils extends StatelessWidget {
  final NewsModel newsModel;

  const Newsdeatils({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 330,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      newsModel.urlToImage?.isNotEmpty == true
                          ? newsModel.urlToImage!
                          : "https://www.hindustantimes.com/ht-img/img/2024/10/07/550x309/Prime-Minister-Narendra-Modi-and-Maldives-Presiden_1728317636195_1728317752751.jpg",
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  newsModel.title ?? "No Title Available",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      newsModel.publishedAt != null
                          ? DateFormat('dd-MM-yyyy')
                              .format(newsModel.publishedAt!)
                          : "Unknown Date",
                      style: const TextStyle(color: Colors.orange),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Center(
                          child: Text(
                        newsModel.author?.isNotEmpty == true
                            ? newsModel.author![0]
                            : "?",
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      maxLines: 1,
                      newsModel.author?.isNotEmpty == true
                          ? newsModel.author!
                          : "Unknown Author",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      newsModel.description ?? "No description available.",
                      style: const TextStyle(color: Colors.white),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

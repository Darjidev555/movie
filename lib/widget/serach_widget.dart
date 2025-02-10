import 'package:flutter/material.dart';
import 'package:movie/controller/news_controller.dart';
import 'package:get/get.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Search News",
                  hintStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.white),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[600]),
            ),
          ),
          Obx(() => newsController.isNewsForYouLoading.value
              ? Container(
                  padding: const EdgeInsets.all(10),
                  height: 48,
                  width: 50,
                  color: Colors.orange,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : InkWell(
                  onTap: () {
                    newsController.searchNews(searchController.text);
                  },
                  child: Container(
                    height: 48,
                    width: 50,
                    color: Colors.orange,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}

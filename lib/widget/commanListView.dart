import 'package:flutter/material.dart';
import 'package:movie/widget/commantextwidget.dart';

class Commanlistview extends StatefulWidget {
  const Commanlistview({super.key});

  @override
  State<Commanlistview> createState() => _CommanlistviewState();
}

class _CommanlistviewState extends State<Commanlistview> {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenHeight * 0.2,
                  height: screenWidth * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage("assets/images/movie.jpg"),
                          fit: BoxFit.cover)),
                  // You can customize the container
                  child: Center(child: Icon(Icons.star, color: Colors.white)),
                ),
                SizedBox(height: 8),
                CommonTextWidget(
                  text: items[index],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

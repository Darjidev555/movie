import 'package:flutter/material.dart';
import 'package:movie/utils/constants.dart';
import 'package:movie/widget/commanListView.dart';
import 'package:movie/widget/commantextwidget.dart';
import 'package:movie/widget/customdrawer.dart';
import 'package:movie/widget/movieList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CommonTextWidget(
            text: "Movie",
            fontFamily: gothamBold,
          ),
        ),
         drawer: Customdrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextWidget(
                      text: "Now Showing",
                      fontFamily: gothamBold,
                      fontSize: 18,
                    ),
                    Container(
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: CommonTextWidget(
                        text: "See more",
                        fontSize: 10,
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Commanlistview(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextWidget(
                      text: "Popular",
                      fontFamily: gothamBold,
                      fontSize: 18,
                    ),
                    Container(
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: CommonTextWidget(
                        text: "See more",
                        fontSize: 10,
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                MovieList(),
              ],
            ),
          ),
        ));
  }
}

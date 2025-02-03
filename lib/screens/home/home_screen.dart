import 'package:flutter/material.dart';
import 'package:movie/widget/commantextwidget.dart';
import 'package:movie/widget/customdrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CommonTextWidget(text: "Home Page"),
      ),
      drawer: Customdrawer(
      ),
      body: Container(
        height: 30,
        width: 30,
        color: Colors.red,
      ),
    );
  }
}

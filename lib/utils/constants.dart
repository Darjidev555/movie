import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

void showSnackBarWithTitleAndText(String title, String message) {
  Get.snackbar(title, message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2));
}

///url
String baseUrl = "https://newsapi.org/";

///font family
const String gothamBold = "GothamBold";
const String gothamBoldItalic = "GothamBoldItalic";
const String gothamBook = "GothamBook";
const String gothamBookItalic = "GothamBookItalic";
const String gothamLight = "GothamLight";
const String gothamMedium = "GothamMedium";

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/bottomnav_controller.dart';

import '../component/navigationbar.dart';

class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavcontroller controller = Get.put(Bottomnavcontroller());
    return Scaffold(
        backgroundColor: Colors.black54,
        bottomNavigationBar: const Navigationbar(),
        body: Obx(() => controller.pages[controller.index.value]));
  }
}

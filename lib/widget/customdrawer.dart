import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/auth_controller.dart';
import 'package:movie/screens/login/login_screen.dart';
import 'package:movie/widget/commantextwidget.dart';

class Customdrawer extends StatefulWidget {
  const Customdrawer({super.key});

  @override
  State<Customdrawer> createState() => _CustomdrawerState();
}

class _CustomdrawerState extends State<Customdrawer> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            authController.userName.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            authController.userEmail.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Logout"),
                          content: Text("Are you sure,do you want to Logout?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                authController.logout(); // Log out
                                Get.offAll(() => LoginScreen());
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffBB84E8),
                  ),
                  child: const Center(
                    child: CommonTextWidget(
                      text: "Logout",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        ListTile(
          title: Text("Settings"),
          onTap: () {
            // Handle settings navigation
            print("Settings tapped");
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          title: Text("Help"),
          onTap: () {
            // Handle help navigation
            print("Help tapped");
            Navigator.pop(context); // Close the drawer
          },
        ),
      ],
    ));
  }
}

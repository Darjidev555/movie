import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/auth_controller.dart';
import 'package:movie/controller/user_profile_controller.dart';

class UserProfileScreen extends StatelessWidget {
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final UserProfileController controller = Get.put(UserProfileController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
              ),
            ),
            // Profile Picture
            /*Center(
              child: GestureDetector(
                onTap: controller.pickImage,
                child: Obx(() => CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: controller.imageUrl.value != null
                          ? FileImage(File(controller.imageUrl.value!))
                          : null,
                      child: controller.imageUrl.value == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.grey[700],
                            )
                          : null,
                    )),
              ),
            ),*/
            SizedBox(height: 20),

            // Name
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            SizedBox(height: 20),

            // Email
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            SizedBox(height: 20),

            // Date of Birth
            TextField(
              controller: controller.dobController,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            SizedBox(height: 20),

            // Phone Number with Country Code
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: DropdownButton<String>(
                    value: controller.countryCodeController.text.isNotEmpty
                        ? controller.countryCodeController.text
                        : '+1', // Default country code
                    onChanged: (newValue) {
                      controller.countryCodeController.text = newValue!;
                    },
                    items: ['+1', '+44', '+91', '+61']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: controller.saveUserProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Save Profile', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

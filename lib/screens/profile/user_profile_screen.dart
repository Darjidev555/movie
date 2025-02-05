import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/auth_controller.dart';
import 'package:movie/screens/login/login_screen.dart';
import 'package:movie/widget/commantextwidget.dart';


class UserProfileScreen extends StatelessWidget {
  //TextEditingController dobController = TextEditingController();
  //TextEditingController phoneController = TextEditingController();

  //final UserProfileController controller = Get.put(UserProfileController());

  //final AuthController authController = Get.find<AuthController>();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: CommonTextWidget(
          text: "Profile",
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
              ),
              // Profile Picture
              SizedBox(height: 20),
              Text(
                authController.userName.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                authController.userEmail.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
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
              ),

              // Name
              /* TextField(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

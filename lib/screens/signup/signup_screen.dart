import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie/screens/login/login_screen.dart';
import 'package:movie/screens/login/passwordcontroller.dart';
import 'package:movie/widget/commantextfiledwidget.dart';
import 'package:movie/widget/commantextwidget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PasswordController controller = Get.put(PasswordController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          leadingWidth: screenWidth * 1,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.arrow_back_ios),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: CommonTextWidget(
                    text: "Back",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            CommonTextWidget(
              text: "Sign up",
              fontSize: 24,
              color: Color(0xff471AA0),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            CommonTextFieldWidget(
              customDecoration: InputDecoration(
                hintText: "Full Name",
                //hintStyle: TextStyle(color:Color(0xff000000) ),
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff9747FF), width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff9747FF), width: 2.0),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            CommonTextFieldWidget(
              customDecoration: InputDecoration(
                hintText: "Email",
                //hintStyle: TextStyle(color:Color(0xff000000) ),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff9747FF), width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff9747FF), width: 2.0),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Obx(
              () => CommonTextFieldWidget(
                isPassword: controller.obscureText.value,
                prefixIcon: Icon(Icons.lock, color: Colors.purple),
                customDecoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: controller.toggleVisibility,
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9747FF), width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    )),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                  color: Color(0xffBB84E8),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: CommonTextWidget(
                  text: "Sigin up",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextWidget(
                    text: "Already have an account ? ",
                    color: Color(0xff471AA0)),
                InkWell(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: CommonTextWidget(
                    text: "Sign in",
                    color: Color(0xff471AA0),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

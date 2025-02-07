import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/auth_controller.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/login/passwordcontroller.dart';
import 'package:movie/screens/signup/signup_screen.dart';
import 'package:movie/widget/commantextfiledwidget.dart';
import 'package:movie/widget/commantextwidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final PasswordController controller = Get.put(PasswordController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.3,
                  child: Image.asset(
                    "assets/images/logo-no-background 1@2x.png",
                    scale: 1.0,
                  ),
                )
              ],
            ),
            CommonTextWidget(
              text: "Sign in",
              fontSize: 24,
              color: Color(0xff471AA0),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            CommonTextFieldWidget(
              controller: emailController,
              customDecoration: InputDecoration(
                hintText: "Email or Username",
                //hintStyle: TextStyle(color:Color(0xff000000) ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.purple,
                ),
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
                controller: passwordController,
                isPassword: controller.obscureText.value,
                prefixIcon: Icon(Icons.lock, color: Colors.purple),
                customDecoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.lock, color: Colors.purple),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonTextWidget(
                  text: "Forget Password?",
                  color: Color(0xff471AA0),
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            InkWell(
              onTap: () async {
                var user = await authController.login(
                  emailController.text,
                  passwordController.text,
                );
                if (user != null) {
                  Get.to(() => HomeScreen());
                }
              },
              child: Container(
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                    color: Color(0xffBB84E8),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: CommonTextWidget(
                    text: "Sigin in",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextWidget(
                  text: "Or Sign in with",
                  color: Color(0xff471AA0),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    var user = await authController.googleSignIn();
                    if (user != null) {
                      Get.to(() => HomeScreen());
                    }
                  },
                  child: Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/googlelogo.png"),
                    )),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextWidget(
                    text: "Don't Have account ?", color: Color(0xff471AA0)),
                InkWell(
                  onTap: () {
                    Get.to(SignupScreen());
                  },
                  child: CommonTextWidget(
                    text: "Sign Up",
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

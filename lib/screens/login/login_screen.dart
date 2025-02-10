import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/auth_controller.dart';
import 'package:movie/controller/homepage_controller.dart';
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

    void validateAndLogin() async {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar("Error", "All fields are required",
            snackPosition: SnackPosition.TOP);
        return;
      }
      if (!GetUtils.isEmail(emailController.text)) {
        Get.snackbar("Error", "Enter a valid email",
            snackPosition: SnackPosition.TOP, colorText: Colors.red);
        return;
      }
      if (passwordController.text.length < 6) {
        Get.snackbar("Error", "Password must be at least 6 characters",
            snackPosition: SnackPosition.TOP);
        return;
      }

      var user = await authController.login(
          emailController.text, passwordController.text);
      if (user != null) {
        Get.offAll(() => Homepagecontroller());
      }
    }

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
                  child:
                      Image.asset("assets/images/logo-no-background 1@2x.png"),
                )
              ],
            ),
            const CommonTextWidget(
              text: "Sign in",
              fontSize: 24,
              color: Color(0xff471AA0),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: screenHeight * 0.03),
            CommonTextFieldWidget(
              controller: emailController,
              customDecoration: InputDecoration(
                hintText: "Email or Username",
                prefixIcon: const Icon(Icons.person, color: Colors.purple),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Obx(
              () => CommonTextFieldWidget(
                controller: passwordController,
                isPassword: controller.obscureText.value,
                prefixIcon: const Icon(Icons.lock, color: Colors.purple),
                customDecoration: InputDecoration(
                  hintText: "Password",
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
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonTextWidget(
                    text: "Forget Password?",
                    color: Color(0xff471AA0),
                    fontWeight: FontWeight.bold)
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            InkWell(
              onTap: validateAndLogin,
              child: Container(
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                    color: const Color(0xffBB84E8),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: CommonTextWidget(
                      text: "Sign in",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.08),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextWidget(
                    text: "Or Sign in with",
                    color: Color(0xff471AA0),
                    fontWeight: FontWeight.bold)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    var user = await authController.googleSignIn();
                    if (user != null) {
                      Get.to(() => const HomeScreen());
                    }
                  },
                  child: Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/googlelogo.png"))),
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CommonTextWidget(
                    text: "Don't Have an account?", color: Color(0xff471AA0)),
                InkWell(
                  onTap: () => Get.to(const SignupScreen()),
                  child: const CommonTextWidget(
                      text: "Sign Up",
                      color: Color(0xff471AA0),
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/auth_controller.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/login/login_screen.dart';
import 'package:movie/screens/login/passwordcontroller.dart';
import 'package:movie/widget/commantextfiledwidget.dart';
import 'package:movie/widget/commantextwidget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final PasswordController controller = Get.put(PasswordController());

    // Validation Controller
    final RxString nameError = ''.obs;
    final RxString emailError = ''.obs;
    final RxString passwordError = ''.obs;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: screenWidth * 1,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Row(
            children: [
              SizedBox(width: 20),
              Icon(Icons.arrow_back_ios),
              Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: CommonTextWidget(
                  text: "Back",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CommonTextWidget(
              text: "Sign up",
              fontSize: 24,
              color: Color(0xff471AA0),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: screenHeight * 0.04),

            // Full Name Field
            CommonTextFieldWidget(
              controller: nameController,
              customDecoration: InputDecoration(
                hintText: "Full Name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xff9747FF), width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff9747FF), width: 2.0),
                ),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  nameError.value = "Full Name is required";
                } else {
                  nameError.value = "";
                }
              },
            ),
            Obx(() => nameError.value.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 4),
                    child: Text(nameError.value,
                        style: TextStyle(color: Colors.red)),
                  )
                : SizedBox.shrink()),
            SizedBox(height: screenHeight * 0.04),
            CommonTextFieldWidget(
              controller: emailController,
              customDecoration: InputDecoration(
                hintText: "Email",
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xff9747FF), width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff9747FF), width: 2.0),
                ),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  emailError.value = "Email is required";
                } else if (!GetUtils.isEmail(value)) {
                  emailError.value = "Enter a valid email";
                } else {
                  emailError.value = "";
                }
              },
            ),
            Obx(() => emailError.value.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 4),
                    child: Text(emailError.value,
                        style: TextStyle(color: Colors.red)),
                  )
                : SizedBox.shrink()),

            SizedBox(height: screenHeight * 0.04),

            // Password Field
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextFieldWidget(
                    controller: passwordController,
                    isPassword: controller.obscureText.value,
                    prefixIcon: const Icon(Icons.lock, color: Colors.purple),
                    customDecoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
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
                        borderSide: const BorderSide(
                            color: Color(0xff9747FF), width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        passwordError.value = "Password is required";
                      } else if (value.length < 6) {
                        passwordError.value =
                            "Password must be at least 6 characters";
                      } else {
                        passwordError.value = "";
                      }
                    },
                  ),
                  Obx(() => passwordError.value.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 4),
                          child: Text(passwordError.value,
                              style: TextStyle(color: Colors.red)),
                        )
                      : SizedBox.shrink()),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            // Sign Up Button
            InkWell(
              onTap: () {
                // Validate Form
                if (nameError.value.isEmpty &&
                    emailError.value.isEmpty &&
                    passwordError.value.isEmpty) {
                  authController
                      .register(emailController.text, passwordController.text,
                          nameController.text)
                      .then((user) {
                    if (user != null) {
                      Get.to(const HomeScreen());
                    }
                  });
                } else {
                  Get.snackbar("Error", "Please fix the errors",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              child: Container(
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                    color: const Color(0xffBB84E8),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: CommonTextWidget(
                    text: "Sign up",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.08),
            const Spacer(),

            // Already have an account? Sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CommonTextWidget(
                    text: "Already have an account? ",
                    color: Color(0xff471AA0)),
                InkWell(
                  onTap: () {
                    Get.to(const LoginScreen());
                  },
                  child: const CommonTextWidget(
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

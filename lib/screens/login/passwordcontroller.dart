import 'package:get/get.dart';

class PasswordController extends GetxController {
  var obscureText = true.obs;

  void toggleVisibility() {
    obscureText.value = !obscureText.value;
  }
}

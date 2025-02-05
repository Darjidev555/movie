import 'package:get/get.dart';
import 'package:movie/screens/articles/artical_page.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/profile/user_profile_screen.dart';

class Bottomnavcontroller extends GetxController {
  RxInt index = 0.obs;
  var pages = [HomeScreen(), Articalpage(), UserProfileScreen()];
}

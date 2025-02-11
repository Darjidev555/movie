import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie/controller/homepage_controller.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/login/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  RxBool isLoading = false.obs;
  var errorMessage = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var userName = ''.obs;
  var userEmail = ''.obs;

  @override
  void onReady() {
    super.onReady();
    checkUserLoginStatus();
  }

  void checkUserLoginStatus() {
    User? user = _auth.currentUser;
    if (user != null) {
      userName.value = user.displayName ?? 'User';
      userEmail.value = user.email ?? '';
      Get.offAll(() => const Homepagecontroller());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  // Register method
  Future<User?> register(String email, String password, String name) async {
    try {
      isLoading.value = true;
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);
      userName.value = name;
      userEmail.value = email;
      isLoading.value = false;
      Get.offAll(() => Homepagecontroller());

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      errorMessage.value = e.message ?? 'Registration Failed';
      Get.snackbar('Error', errorMessage.value);
      return null;
    }
  }

  // Login method
  Future<User?> login(String email, String password) async {
    try {
      isLoading.value = true;
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      userName.value = userCredential.user?.displayName ?? 'User';
      userEmail.value = email;

      Get.offAll(() => HomeScreen()); // Redirect to Home after login
      isLoading.value = false;
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      errorMessage.value = e.message ?? 'Login Failed';
      Get.snackbar('Error', errorMessage.value);
      return null;
    }
  }

  // Google Sign-In method
  Future<User?> googleSignIn() async {
    try {
      isLoading.value = true;
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      userName.value = userCredential.user?.displayName ?? 'Google User';
      userEmail.value = userCredential.user?.email ?? '';

      Get.offAll(() => HomeScreen()); // Redirect to Home after Google login
      isLoading.value = false;
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      errorMessage.value = e.message ?? 'Google Sign-In Failed';
      Get.snackbar('Error', errorMessage.value);
      return null;
    }
  }

  User? get currentUser => _auth.currentUser;

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAll(() => const LoginScreen()); // Redirect to Login after logout
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie/controller/homepage_controller.dart';
import 'package:movie/controller/network_controller.dart';
import 'package:movie/screens/noInternet/NoInternetScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY'] ?? '',
      projectId: dotenv.env['APP_ID'] ?? '',
      storageBucket: dotenv.env['STORAGE_BUCKET'] ?? '',
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'] ?? '',
      appId: dotenv.env['APP_ID'] ?? '',
    ),
  );
  Get.put(NetworkController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GlobalScaffold(),
    );
  }
}

//Global Wrapper to Show No Internet UI on All Screens
class GlobalScaffold extends StatelessWidget {
  GlobalScaffold({super.key});

  final NetworkController networkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return networkController.isConnected.value
          ? Homepagecontroller()
          : NoInternetScreen();
    });
  }
}
/*
SHA1: FF:F2:DA:CE:33:88:58:45:7A:F9:7B:EC:61:81:37:7F:BF:4C:EC:05
SHA-256: 8A:E1:C3:42:D1:48:1D:CE:7A:E5:59:DC:D7:39:F5:07:29:CA:2B:F3:48:F9:F4:EF:D9:AE:A2:A5:FE:82:C1:4B*/

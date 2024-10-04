import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  Future<User?> checkUserLoggedIn() async {
    await Future.delayed(const Duration(seconds: 3));
    return FirebaseAuth.instance.currentUser;
  }
}

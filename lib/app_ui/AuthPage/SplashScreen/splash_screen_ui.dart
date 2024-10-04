import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/AuthPage/SplashScreen/splash_screen_controller.dart';
import 'package:grocery_app/generated/assets.dart';
import '../../MainScreen/main_screen.dart';
import '../FaceBookAndGoogleLogin/facebook_and_google_login.dart';

class SplashScreenUi extends StatelessWidget {
  const SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFF53B175),
          body: FutureBuilder<User?>(
            future: controller.checkUserLoggedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildSplashScreen(context);
              } else if (snapshot.hasData) {
                return MainScreen();
              } else {
                return const FacebookAndGoogleLogin();
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildSplashScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SvgPicture.asset(
            Assets.vectorsCarrot,
            height: 100.h,
          ),
          const SizedBox(height: 20),
          const Text(
            'nectar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'online groceries',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),

          SizedBox(
            height: 30.h,),
          const CircularProgressIndicator(
            color: Colors
                .white, // Circular indicator in white to match the text
          ),
        ],
      ),
    );
  }
}
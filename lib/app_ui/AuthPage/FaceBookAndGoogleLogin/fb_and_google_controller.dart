import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/routes/app_pages.dart';
import 'package:grocery_app/routes/app_routes.dart';
import '../../MainScreen/main_screen.dart';

class FaceboookAndGoogleController extends GetxController {
  // Function to handle Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User cancelled the sign-in process
        Get.snackbar('Cancelled', 'Google Sign-In was cancelled');
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in: ${userCredential.user?.displayName}');
      Get.offNamed(AppRoutes.mainPage);
    } catch (e) {
      print('Google Sign-In Error: $e');
      Get.snackbar('Error', 'Failed to sign in with Google: ${e.toString()}');
    }
  }
  // Function to handle Facebook Sign-In
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        print(userCredential.user?.displayName);
        Get.offNamed(AppRoutes.mainPage);

      } else {
        Get.snackbar('Login Failed', result.message ?? 'Unknown error occurred');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Facebook: $e');
    }
  }
}


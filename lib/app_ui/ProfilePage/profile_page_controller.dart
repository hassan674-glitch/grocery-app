import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePageController extends GetxController{

  Future<void> logout() async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Sign out from Google if logged in with Google
      GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }

      // Sign out from Facebook if logged in with Facebook
      await FacebookAuth.instance.logOut();

      // Optionally, you can clear other stored user data or navigate to login screen
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

}
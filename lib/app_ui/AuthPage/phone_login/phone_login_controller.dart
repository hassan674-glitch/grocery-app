import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/app_ui/AuthPage/phone_login/otp_screen.dart';
import 'package:grocery_app/app_ui/MainScreen/main_screen.dart';

class PhoneAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(null);
  RxBool isLoading = false.obs;
  RxString verificationId = ''.obs;

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<void> sendOtp(String phoneNumber) async {
    try {
      isLoading.value = true;
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-retrieval successful (Android only)
          await _signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
        codeSent: (String verId, int? resendToken) {
          verificationId.value = verId;
          // Navigate to OTP input screen
          Get.to(() => OtpInputScreen());
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId.value = verId;
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to send OTP: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      isLoading.value = true;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );
      await _signInWithCredential(credential);
      // Navigate to home screen or next step in your app
      Get.to(MainScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify OTP: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      final userCredential = await _auth.signInWithCredential(credential);
      user.value = userCredential.user;
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in: $e');
    }
  }

}
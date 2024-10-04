import 'package:get/get.dart';
import 'package:grocery_app/app_ui/AuthPage/FaceBookAndGoogleLogin/fb_and_google_controller.dart';

class FaceBookAndGoogleBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FaceboookAndGoogleController>(()=>FaceboookAndGoogleController());
  }

}
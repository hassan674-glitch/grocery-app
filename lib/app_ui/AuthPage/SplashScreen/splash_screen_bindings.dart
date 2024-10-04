import 'package:get/get.dart';
import 'package:grocery_app/app_ui/AuthPage/SplashScreen/splash_screen_controller.dart';


class SplashScreenBidings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashScreenController>(()=>SplashScreenController());
  }
}
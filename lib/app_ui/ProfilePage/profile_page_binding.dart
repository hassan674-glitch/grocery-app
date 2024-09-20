import 'package:get/get.dart';
import 'package:grocery_app/app_ui/ProfilePage/profile_page_controller.dart';
class ProfilePageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfilePageController>(()=>ProfilePageController());
  }
}
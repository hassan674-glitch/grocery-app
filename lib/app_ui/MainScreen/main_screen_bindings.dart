import 'package:get/get.dart';
import '../HomePage/home_page_controller.dart';
import 'main_screen_controller.dart';
import '../Explore/explore_page_controller.dart';
import '../CartPage/cart_page_controller.dart';
import '../Favourite/favourite_page_controller.dart';
import '../ProfilePage/profile_page_controller.dart';

class MainScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
    Get.put(HomePageController());
    Get.put(ExplorePageController());
    Get.put(CartPageController());
    Get.put(FavouritePageController());
    Get.put(ProfilePageController());
  }
}
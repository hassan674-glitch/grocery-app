

import 'package:get/get.dart';
import 'package:grocery_app/app_ui/AuthPage/FaceBookAndGoogleLogin/facebook_and_google_login.dart';
import 'package:grocery_app/app_ui/AuthPage/FaceBookAndGoogleLogin/fb_and_google_bindings.dart';
import 'package:grocery_app/app_ui/AuthPage/SplashScreen/splash_screen_bindings.dart';
import 'package:grocery_app/app_ui/AuthPage/SplashScreen/splash_screen_ui.dart';
import 'package:grocery_app/app_ui/CartPage/cart_page_ui.dart';
import 'package:grocery_app/app_ui/Explore/explore_page_binding.dart';
import 'package:grocery_app/app_ui/Explore/explorer_ui.dart';
import 'package:grocery_app/app_ui/Favourite/favourite_page_bindings.dart';
import 'package:grocery_app/app_ui/Favourite/favourite_page_ui.dart';
import 'package:grocery_app/app_ui/ProductDetail/product_page_bindings.dart';
import 'package:grocery_app/app_ui/ProfilePage/profile_page_ui.dart';
import '../app_ui/CartPage/cart_page_binding.dart';
import '../app_ui/HomePage/home_page_binding.dart';
import '../app_ui/HomePage/home_page_ui.dart';
import '../app_ui/MainScreen/main_screen.dart';
import '../app_ui/MainScreen/main_screen_bindings.dart';
import '../app_ui/ProductDetail/product_page_ui.dart';
import '../app_ui/ProfilePage/profile_page_binding.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(name: AppRoutes.splashPage,
        page: ()=>SplashScreenUi(),
    binding: SplashScreenBidings(),
    ),
    GetPage(name: AppRoutes.LoginPage,
      page:()=> FacebookAndGoogleLogin(),
    binding: FaceBookAndGoogleBindings(),
    ),
    GetPage(
        name: AppRoutes.mainPage,
        page:()=>MainScreen(),
      binding: MainScreenBindings()
  ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(name: AppRoutes.explorePage,
        page:()=> ExplorePageUI(),
      binding: ExplorePageBinding()
    ),
    GetPage(name: AppRoutes.cartPage,
        page:()=> CartPageUi(),
        binding: CartPageBinding()
    ),
    GetPage(name: AppRoutes.favourritePage,
        page:()=> FavouritePageUi(),
        binding:FavouritePageBinding()
    ),
    GetPage(name: AppRoutes.profilePage,
        page:()=> ProfilePageUi(),
        binding:ProfilePageBinding()
    ),
    GetPage(name: AppRoutes.ProductPage,
        page: ()=> ProductDetailPageUi(),
    binding: ProductPageBindings()
    )
  ];
}

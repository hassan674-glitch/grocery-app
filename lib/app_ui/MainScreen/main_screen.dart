import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../CartPage/cart_page_ui.dart';
import '../Explore/explorer_ui.dart';
import '../Favourite/favourite_page_ui.dart';
import '../HomePage/home_page_ui.dart';
import '../ProfilePage/profile_page_ui.dart';
import '../../utilis/color.dart';
import '../../widgets/svg_image.dart';
import 'main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainScreenController>(
      init: MainScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: IndexedStack(
            index: controller.selectedPage.value,
            children: const [
              HomePage(),
              ExplorePageUI(),
              CartPageUi(),
              FavouritePageUi(),
              ProfilePageUi(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              _buildBottomNavigationBarItem(
                Assets.vectorsHome,
                "Home",
                controller.selectedPage.value == 0,
              ),
              _buildBottomNavigationBarItem(
                Assets.vectorsSearch,
                "Explore",
                controller.selectedPage.value == 1,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 28,
                  color: controller.selectedPage.value == 2
                      ? AppColor.colorPrimaryLightGreen
                      : AppColor.black,
                ),
                label: 'Cart',
              ),
              _buildBottomNavigationBarItem(
                Assets.vectorsHeart,
                "Favourite",
                controller.selectedPage.value == 3,
              ),
              _buildBottomNavigationBarItem(
                Assets.vectorsPerson,
                "Profile",
                controller.selectedPage.value == 4,
              ),
            ],
            currentIndex: controller.selectedPage.value,
            selectedItemColor: AppColor.colorPrimaryLightGreen,
            unselectedItemColor: Colors.black54,
            onTap: controller.onItemTapped,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String iconAsset,
      String label,
      bool isSelected,
      ) {
    return BottomNavigationBarItem(
      icon: SvgImage(
        source: iconAsset,
        width: 15,
        height: 20,
        color: isSelected ? AppColor.colorPrimaryLightGreen : AppColor.black,
      ),
      label: label,
    );
  }
}
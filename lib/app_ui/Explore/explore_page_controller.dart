import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/generated/assets.dart';

import 'beverages_page/beverages_page_ui.dart';

class ExplorePageController extends GetxController {
  final List<Category> categories = [
    Category(name: "Fresh Fruits & Vegetables", image: Assets.imagesFruits, color: Colors.green),
    Category(name: "Cooking Oil & Ghee", image: Assets.imagesCooking, color: Colors.orange),
    Category(name: "Meat & Fish", image: Assets.imagesMeat, color: Colors.red),
    Category(name: "Bakery & Snacks", image: Assets.imagesBakery, color: Colors.purple),
    Category(name: "Dairy & Eggs", image: Assets.imagesDairy, color: Colors.yellow),
    Category(name: "Beverages", image: Assets.imagesBeverges, color: Colors.blue),
  ];

  void onCategoryPressed(Category category) {
    if (category.name == "Beverages") {
      Get.to(() => const BeveragesPage());
    } else {
      // For other categories, you can add different navigation logic or show a message
      Get.snackbar(
        'Category Pressed',
        '${category.name} page is not implemented yet',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class Category {
  final String name;
  final String image;
  final Color color;

  Category({required this.name, required this.image, required this.color});
}
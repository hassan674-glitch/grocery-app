import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/Explore/explore_page_controller.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';

class ExplorePageUI extends GetView<ExplorePageController> {
  const ExplorePageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16).r,
            child: Center(
              child: NunitoText(
                text: "Find Products",
                fontStyle: FontStyle.italic,
                fontSize: 25,
                decorationColor: AppColor.darkGrey,
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Search Bar
          Padding(
            padding: EdgeInsets.all(8.0).w,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: AppColor.hintTextColor),
                labelText: 'Search Store',
                labelStyle: TextStyle(color: AppColor.hintTextColor),
                filled: true,
                fillColor: AppColor.fillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Grid View of Categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: controller.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                ),
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return _buildCategoryCard(category);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Category Card
  Widget _buildCategoryCard(Category category) {
    return GestureDetector(
      onTap: () => controller.onCategoryPressed(category),
      child: Container(
        decoration: BoxDecoration(
          color: category.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: category.color.withOpacity(0.6)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.image,
              height: 70.h,
              width: 70.w,
            ),
            SizedBox(height: 8.h),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.darkGrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
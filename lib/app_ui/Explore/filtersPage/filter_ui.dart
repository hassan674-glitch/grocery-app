import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final List<String> categories = [
    "Eggs",
    "Noodles & Pasta",
    "Chips & Crisps",
    "Fast Food"
  ];

  final List<String> brands = [
    "Individual Collection",
    "Cocola",
    "Ifad",
    "Kazi Farmas"
  ];

  Map<String, bool> selectedCategories = {};
  Map<String, bool> selectedBrands = {};

  @override
  void initState() {
    super.initState();
    selectedCategories = {
      for (var category in categories) category: false,
    };
    selectedBrands = {
      for (var brand in brands) brand: false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(CupertinoIcons.back),
                ),
                SizedBox(width: 60.w),
                NunitoText(
                  text: "Filters",
                  fontSize: 25.sp,
                  fontStyle: FontStyle.italic,
                  decorationColor: AppColor.darkGrey,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColor.fillColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categories Section
                    NunitoText(
                      text: "Categories",
                      fontSize: 25.sp,
                      fontStyle: FontStyle.italic,
                    ),
                    SizedBox(height: 10.h),

                    // Dynamically generating the checkboxes and labels
                    ...categories.map((category) {
                      return Row(
                        children: [
                          Checkbox(
                            activeColor: AppColor.colorPrimaryLightGreen,
                            value: selectedCategories[category],
                            onChanged: (value) {
                              setState(() {
                                selectedCategories[category] = value!;
                              });
                            },
                          ),
                          NunitoText(
                            text: category,
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ],
                      );
                    }).toList(),

                    SizedBox(height: 10.h),

                    // Brand Section
                    NunitoText(
                      text: "Brand",
                      fontSize: 25.sp,
                      fontStyle: FontStyle.italic,
                    ),
                    SizedBox(height: 10.h),

                    // Dynamically generating the checkboxes and labels for brands
                    ...brands.map((brand) {
                      return Row(
                        children: [
                          Checkbox(
                            activeColor: AppColor.colorPrimaryLightGreen,
                            value: selectedBrands[brand],
                            onChanged: (value) {
                              setState(() {
                                selectedBrands[brand] = value!;
                              });
                            },
                          ),
                          NunitoText(
                            text: brand,
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),

            Spacer(),

            // Apply Filter Button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.darkGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                  ),
                  child: NunitoText(
                    text: "Apply Filter",
                    fontSize: 18.sp,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

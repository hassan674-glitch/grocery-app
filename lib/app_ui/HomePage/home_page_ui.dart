import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/routes/app_routes.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';
import 'package:grocery_app/widgets/svg_image.dart';
import '../../generated/assets.dart';
import 'home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> sliderImages = [
    Assets.imagesSlidephoto,
    Assets.imagesSliderimage2,
    Assets.imagesSliderimage3,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomePageController>(
          builder: (homePageController) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with Location
                  Container(
                    height: 100.h,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SvgImage(source: Assets.vectorsCarrot),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 130.w),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: AppColor.hintTextColor),
                              NunitoText(
                                text: "Dhaka, Banassre",
                                textAlign: TextAlign.center,
                                textColor: AppColor.hintTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: AppColor.hintTextColor),
                        labelText: 'Search',
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
                  // Slider Section
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 130.0.h,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.823,
                    ),
                    items: sliderImages.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.h),
                  // Exclusive Offer Section
                  // Exclusive Offer Section
                  _buildSectionHeader(context, 'Exclusive Offer'),
                  SizedBox(height: 1.h),

                  Container(
                    height: 220.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: homePageController.exclusiveOfferItems.length,
                      scrollDirection: Axis.horizontal,  // Horizontal scrolling for exclusive offers
                      itemBuilder: (context, index) {
                        final item = homePageController.exclusiveOfferItems[index];
                        return _buildProductCard(
                          item.name,
                          item.unit,
                          item.price.toStringAsFixed(2),
                          item.image,
                        );
                      },
                    ),
                  ),

                  //Best Selling Section
                  _buildSectionHeader(context, 'Best Selling'),
                  Container(
                    height: 220.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: homePageController.homePageItems.length ,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildProductCard(
                              homePageController.homePageItems[index].name,
                              homePageController.homePageItems[index].unit,
                              homePageController.homePageItems[index].price.toStringAsFixed(2),
                              homePageController.homePageItems[index].image,
                            )
                          ],
                        );
                      },
                    ),
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Section Header
Widget _buildSectionHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.all(8).w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'See all',
          style: TextStyle(color: Colors.green),
        ),
      ],
    ),
  );
}

// Product Card
Widget _buildProductCard(String title, String subtitle, String price, String imageUrl) {
  return Container(
    height: 220.h, 
    margin: EdgeInsets.only(right: 10).w,
    width: 165.w,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NunitoText(text:title, fontSize: 20.sp,fontStyle: FontStyle.italic,),
                  SizedBox(height: 2.h),
                  NunitoText(text:subtitle, fontSize: 12.sp,fontStyle: FontStyle.italic,textColor: Colors.grey,),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    NunitoText(text: price,fontStyle: FontStyle.italic,fontSize: 12.sp,),
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Colors.green,size: 30.sp,),
                        onPressed: () {
                          Get.toNamed(AppRoutes.ProductPage);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


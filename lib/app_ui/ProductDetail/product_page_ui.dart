import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/app_ui/ProductDetail/product_page_controller.dart';
import '../../generated/assets.dart';

class ProductDetailPageUi extends StatefulWidget {
  const ProductDetailPageUi({super.key});

  @override
  State<ProductDetailPageUi> createState() => _ProductDetailPageUiState();
}

class _ProductDetailPageUiState extends State<ProductDetailPageUi> {
  final List<String> sliderImages = [
    Assets.imagesBulppaper,
    Assets.imagesBanana,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ProductPageController>(
          builder: (homePageController) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(

                  backgroundColor: Colors.white,
                  pinned: true,
                  expandedHeight: 250.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(Assets.imagesApple,fit: BoxFit.cover,),
                  ),
                leading: IconButton(onPressed: () {Get.back();  }, icon: Icon(CupertinoIcons.back),
                ),
                actions: [
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.shopping_cart))]
                ),
                // SliverToBoxAdapter for Product Details
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Naturel Red Apple",
                              style: GoogleFonts.nunito(
                                  fontSize: 30.sp,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Icon(CupertinoIcons.heart)
                          ],
                        ),
                        Text(
                          "1kg, Price",
                          style: GoogleFonts.nunito(fontSize: 16.sp, color: Colors.grey),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildQuantitySelector(),
                            Text(
                              "\$4.99",
                              style: GoogleFonts.nunito(fontSize: 25.sp, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Divider(),
                      ],
                    ),
                  ),
                ),

                // SliverToBoxAdapter for Product Detail, Nutritions, and Review Sections
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildExpandableSection("Product Detail", "Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthful And Varied Diet."),
                        _buildExpandableSection("Nutritions", "200g"),
                        _buildReviewSection(),
                      ],
                    ),
                  ),
                ),

                // SliverFillRemaining for the Add to Basket Button
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Add To Basket",
                          style: GoogleFonts.nunito(fontSize: 18.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Quantity Selector Widget
  Widget _buildQuantitySelector() {
    int value = 0;
    return StatefulBuilder( // Use StatefulBuilder for managing state inside a widget
      builder: (context, setState) {
        return Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.green),
              onPressed: () {
                setState(() {
                  if (value > 0) {  // Ensure value does not go below zero
                    value--;
                  }
                });
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value.toString(),  // Corrected: Convert int to String using .toString()
                style: GoogleFonts.nunito(fontSize: 16.0),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_circle, color: Colors.green),
              onPressed: () {
                setState(() {
                  value++;
                });
              },
            ),
          ],
        );
      },
    );
  }

  // Expandable Section Widget
  Widget _buildExpandableSection(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: GoogleFonts.nunito(fontSize: 20.sp, fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            content,
            style: GoogleFonts.nunito(fontSize: 16.sp, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  // Review Section Widget
  Widget _buildReviewSection() {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Review",
            style: GoogleFonts.nunito(fontSize: 20.sp, fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
          ),
          Row(
            children: List.generate(5, (index) => Icon(Icons.star, color: Colors.orange, size: 20)),
          ),
        ],
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            "User reviews will be displayed here.",
            style: GoogleFonts.nunito(fontSize: 16.sp, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

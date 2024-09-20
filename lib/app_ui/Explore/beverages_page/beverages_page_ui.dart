import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/Explore/filtersPage/filter_ui.dart';
import 'package:grocery_app/generated/assets.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';

class BeveragesPage extends StatefulWidget {
  const BeveragesPage({super.key});

  @override
  State<BeveragesPage> createState() => _BeveragesPageState();
}

class _BeveragesPageState extends State<BeveragesPage> {
  // Sample data for beverages
  final List<Map<String, String>> beverages = [
    {
      "name": "Diet Coke",
      "volume": "355ml",
      "price": "\$1.99",
      "image": Assets.imagesCoke,
    },
    {
      "name": "Sprite Can",
      "volume": "325ml",
      "price": "\$1.50",
     "image":Assets.imagesSprite ,
    },
    {
      "name": "Apple & Grape Juice",
      "volume": "2L",
      "price": "\$15.99",
    "image":Assets.imagesTreetop,
    },
    {
      "name": "Orange Juice",
      "volume": "2L",
      "price": "\$15.99",
    "image":Assets.imagesSprite,
    },
    {
      "name": "Coca Cola Can",
      "volume": "325ml",
      "price": "\$4.99",
    "image":Assets.imagesCocacola,
    },
    {
      "name": "Pepsi Can",
      "volume": "330ml",
      "price": "\$4.99",
      "image":Assets.imagesPepsi,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Title Bar
          Padding(
            padding: EdgeInsets.only(top: 30.r, left: 16.r, right: 16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(CupertinoIcons.back),
                ),
                // Spacer(),
                NunitoText(
                  text: "Beverages",
                  fontStyle: FontStyle.italic,
                  fontSize: 25.sp,
                  decorationColor: AppColor.darkGrey,
                ),
                // Spacer(),
               InkWell(
                   onTap: (){
                     Get.to(FiltersPage());
                   },
                   child: SvgPicture.asset(Assets.vectorsTwoIcons)),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          // Beverage Grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: (360 / 780) * 1.4, // Adjust aspect ratio
                ),
                itemCount: beverages.length,
                itemBuilder: (context, index) {
                  final beverage = beverages[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Beverage Image
                        Image.asset(
                          beverage["image"]!,
                          height: 80.h,
                          width: 80.w,
                          fit: BoxFit.contain,
                        ),
                        // Beverage Name and Volume
                        Column(
                          children: [
                            NunitoText(
                              text: beverage["name"]!,
                              fontSize: 14.sp,
                              fontStyle: FontStyle.normal,
                            ),
                            NunitoText(
                              text: beverage["volume"]!,
                              fontSize: 12.sp,
                              textColor: AppColor.darkGrey,
                            ),
                          ],
                        ),
                        // Price and Add button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0).r,
                              child: NunitoText(
                                text: beverage["price"]!,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             width: 45.w,
                             height: 45.h,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(16),
                               color: AppColor.colorPrimaryLightGreen,

                             ),
                             child:IconButton(onPressed: (){},
                                 icon: Icon(CupertinoIcons.plus,)),
                           ),
                         )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

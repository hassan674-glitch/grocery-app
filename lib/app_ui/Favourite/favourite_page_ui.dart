// favourite_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/Favourite/favourite_page_controller.dart';
import 'package:grocery_app/widgets/nunito_text.dart';


class FavouritePageUi extends StatelessWidget {
  const FavouritePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritePageController>(
        init:FavouritePageController(),
        builder: (FavouritePageController){
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: NunitoText(
                      text: "Favourite Page",
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: FavouritePageController.favouriteItem.length,
                      itemBuilder: (context, index) {
                        final items = FavouritePageController.favouriteItem[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: Container(
                                width: 30.w,
                                height: 54.h,
                                child: Image.asset(
                                  items.image,
                                  height: 54.h,
                                  width: 30.w,
                                ),
                              ),
                              title: NunitoText(
                                text: items.name,
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                              subtitle: NunitoText(
                                text: items.unit,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  NunitoText(
                                    text: "${items.price.toString()}\$",
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                    onPressed: () {
                      // Button action
                    },
                    child: NunitoText(
                      text: "Add All To Cart",
                      fontSize: 16,
                      textColor: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 50.h),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

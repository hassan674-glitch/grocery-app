import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/CartPage/cart_page_controller.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';

class CartPageUi extends GetView<CartPageController> {
  const CartPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Title
          Padding(
            padding: EdgeInsets.only(top: 30, left: 16, right: 16).r,
            child: Center(
              child: NunitoText(
                text: "My Cart",
                fontStyle: FontStyle.italic,
                fontSize: 25,
                decorationColor: AppColor.darkGrey,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Divider(),
          // Cart Items List
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                final item = controller.cartItems[index];
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                      child: Row(
                        children: [
                          Image.asset(item.image, width: 60.w, height: 60.h),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NunitoText(
                                  text: item.name,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                                 NunitoText(
                                  text: item.unit,
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove, color: Colors.green),
                                onPressed: () => controller.decrementQuantity(index),
                              ),
                              Obx(() => Text('${item.quantity.value}')),
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.green),
                                onPressed: () => controller.incrementQuantity(index),
                              ),
                            ],
                          ),
                          SizedBox(width: 16.w),
                NunitoText(
                text: item.price.toStringAsFixed(2),
                fontSize: 15,
                fontStyle: FontStyle.italic,
                ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.grey),
                            onPressed: () => controller.removeItem(index),
                          ),
                        ],
                      ),
                    ),

                    if (index < controller.cartItems.length - 1)
                      Divider(),
                  ],
                );
              },
            )),
          ),
          // Checkout Button
          Padding(
            padding: EdgeInsets.all(16.r),
            child: ElevatedButton(
              child: Obx(() => Text('Go to Checkout \$${controller.total.value.toStringAsFixed(2)}')),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50.h),
              ),
              onPressed: controller.goToCheckout,
            ),
          ),
        ],
      ),
    );
  }
}

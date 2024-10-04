import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/widgets/nunito_text.dart';
import 'package:grocery_app/utilis/color.dart';
import 'phone_login_controller.dart';

class OtpInputScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneAuthController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerRight,
                colors: [Colors.red.shade100, Colors.white],
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0).w,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(CupertinoIcons.back),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 70).r,
                              child: NunitoText(
                                text: "Enter Your 4-Digit Code",
                                fontSize: 25.sp,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextField(
                              controller: otpController,
                              decoration: InputDecoration(
                                labelText: 'Enter OTP',
                                enabledBorder: UnderlineInputBorder(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 240).r,
                              child: Obx(() => ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : () => controller.verifyOtp(otpController.text),
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator()
                                    : Icon(Icons.check),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  backgroundColor: AppColor.colorPrimaryLightGreen,
                                  padding: EdgeInsets.all(16).r,
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
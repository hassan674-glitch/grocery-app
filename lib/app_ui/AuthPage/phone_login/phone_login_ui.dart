import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/AuthPage/phone_login/otp_screen.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:grocery_app/app_ui/AuthPage/phone_login/phone_login_controller.dart';

class PhoneLoginUi extends StatefulWidget {
  const PhoneLoginUi({Key? key}) : super(key: key);

  @override
  State<PhoneLoginUi> createState() => _PhoneLoginUiState();
}

class _PhoneLoginUiState extends State<PhoneLoginUi> {
  final TextEditingController phoneController = TextEditingController();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneAuthController>(
      init: PhoneAuthController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
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
                                text: "Enter Your Phone Number",
                                fontSize: 25.sp,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            IntlPhoneField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                enabledBorder: UnderlineInputBorder(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                              initialCountryCode: 'BD',
                              onChanged: (phone) {
                                phoneNumber = phone.completeNumber;
                              },
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 240).r,
                              child: Obx(() => ElevatedButton(
                                onPressed:
                                controller.isLoading.value
                                    ? null
                                    : () => controller.sendOtp(phoneNumber),
                                child:
                                controller.isLoading.value
                                    ? CircularProgressIndicator()
                                    :
                                Icon(Icons.arrow_forward),
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
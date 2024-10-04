import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/app_ui/AuthPage/FaceBookAndGoogleLogin/fb_and_google_controller.dart';
import 'package:grocery_app/app_ui/AuthPage/phone_login/phone_login_ui.dart';
import 'package:grocery_app/generated/assets.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';

class FacebookAndGoogleLogin extends StatefulWidget {
  const FacebookAndGoogleLogin({super.key});

  @override
  State<FacebookAndGoogleLogin> createState() => _FacebookAndGoogleLoginState();
}

class _FacebookAndGoogleLoginState extends State<FacebookAndGoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FaceboookAndGoogleController>(
        init: FaceboookAndGoogleController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesFirstImage),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.all(16.0).r,
                child: Column(
                  children: [
                    NunitoText(
                      text: "Get your groceries with nectar",
                      fontSize: 30.sp,
                      fontStyle: FontStyle.italic,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(Assets.imagesFlag),
                                NunitoText(
                                  text: "+880",
                                  fontSize: 20.sp,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(const PhoneLoginUi());
                            },
                            icon: Icon(Icons.arrow_forward, color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Center(
                      child: NunitoText(
                        text: "Or connect with social media",
                        textColor: AppColor.colorTextGrayLight,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.colorblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        controller.signInWithGoogle();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.vectorsGoogle,
                            height: 20,
                          ),
                          SizedBox(width: 30.w),
                          Text(
                            "Continue With Google",
                            style: GoogleFonts.nunito(fontSize: 18.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.colorblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        controller.signInWithFacebook();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.facebook),
                          SizedBox(width: 30.w),
                          Text(
                            "Continue with Facebook",
                            style: GoogleFonts.nunito(fontSize: 18.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

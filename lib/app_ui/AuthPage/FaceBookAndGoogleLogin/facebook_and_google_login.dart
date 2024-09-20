import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/generated/assets.dart';
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
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.imagesFirstImage,),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: Column(
              children: [
                NunitoText(text: "Get your groceries with nectar",
                  fontSize: 30.sp,
                  fontStyle: FontStyle.italic,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}

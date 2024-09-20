import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/ProfilePage/profile_page_controller.dart';
import 'package:grocery_app/generated/assets.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';

class ProfilePageUi extends GetView<ProfilePageController> {
  const ProfilePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            // Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: AssetImage(Assets.imagesPerson),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          NunitoText(
                            text: "Afsar Hossen",
                           fontStyle: FontStyle.italic,
                            fontSize: 20.sp,
                          ),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.green),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      NunitoText(
                        text: "Imshuvo97@gmail.com",
                        fontStyle: FontStyle.italic,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 30.h),

            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    icon: Assets.vectorsOrdersicon,
                    label: "Orders",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Assets.vectorsPerson,
                    label: "My Details",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Assets.vectorsDeliceryaddress,
                    label: "Delivery Address",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Assets.vectorsPaymenticon,
                    label: "Payment Methods",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Assets.vectorsPromoCordicon, // Assuming this is the promo icon
                    label: "Promo Code",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Assets.vectorsBellicon,
                    label: "Notifications",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Assets.vectorsHelpicon,
                    label: "Help",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Assets.vectorsAbouticon,
                    label: "About",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Log Out Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ElevatedButton.icon(
                icon: Icon(Icons.logout_rounded, color:  AppColor.colorPrimaryLightGreen),
                label: NunitoText(
                  text:"Log Out",
                  fontSize: 15.sp,
                  fontStyle: FontStyle.italic,
                  textColor: AppColor.colorPrimaryLightGreen,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  minimumSize: Size(double.infinity, 50.h),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each menu item
  Widget _buildMenuItem({required String icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: 24.w,
        height: 24.h,
      ),
      title: NunitoText(text: label,
        fontStyle: FontStyle.italic,
        fontSize: 16.sp,
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/helper/svg_helper.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/core/widgets/primary_button.dart';
import 'package:news_app_nti/features/home/presentation/view/home_view.dart';

class LetStartView extends StatelessWidget {
  const LetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 538.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.primary,
                            AppColors.bardBlue,
                          ],
                        ),
                      ),
                    ),
                  ),

                  Image.asset(
                    AppAssetsImages.backGround,
                    width: 430.w,
                    height: 538.h,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: Offset(0, -30.h),
              child: Container(
                width: double.infinity,
                padding: AppPadding.defaultPadding,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 52.h),

                    Text(
                      'Get The Latest News And Updates',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Text(
                      'From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Globe will be right at your hand.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                      ),
                    ),

                    SizedBox(height: 23.h),

                    PrimaryButton(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                          (context) => false,
                        );
                      },
                      text: 'Explore',
                      sizedBoxWidth: 8.w,
                      widget: svgHelper(
                        AppAssetsIcons.whiteArrow,
                        16.w,
                        10.3.h,
                      ),
                    ),

                    SizedBox(height: 69.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

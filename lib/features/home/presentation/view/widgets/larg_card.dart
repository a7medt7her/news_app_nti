import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';

class LargCard extends StatelessWidget {
  const LargCard({
    super.key,
    required this.url,
    required this.title,
    required this.auth,
    this.onTap,
  });
  final String url;
  final String title;
  final String auth;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentGeometry.bottomCenter,
        width: 376.w,
        height: 274.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all((Radius.circular(8.r))),
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),

        child: Container(
          padding: REdgeInsets.only(top: 13, bottom: 1, left: 14, right: 7),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(width: 25.w),

              Text(
                auth,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
              SizedBox(width: 7.w),
            ],
          ),
        ),
      ),
    );
  }
}

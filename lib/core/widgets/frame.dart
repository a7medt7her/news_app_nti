import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/widgets/auth_shape.dart';

class Frame extends StatelessWidget {
  const Frame({
    super.key,
    required this.title,
    required this.nameAuth,
    required this.publishedAt,
    required this.imageUrl,
    this.onTap,
  });
  final String title;
  final String nameAuth;
  final String publishedAt;
  final String imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2),
              SizedBox(
                width: 238.w,

                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 4.h),
              AuthShape(nameAuth: nameAuth, publishedAt: publishedAt),
            ],
          ),
          SizedBox(width: 16.w),
          Container(
            width: 112.w,
            height: 80.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
          ),
        ],
      ),
    );
  }
}

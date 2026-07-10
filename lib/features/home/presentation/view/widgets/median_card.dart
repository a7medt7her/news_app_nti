import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';

class MedianCard extends StatelessWidget {
  const MedianCard({
    super.key,
    required this.urlToImage,
    required this.title,
    this.onTap,
  });
  final String? urlToImage;
  final String? title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 240.w,
            height: 232.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              image: DecorationImage(
                image: NetworkImage(
                  urlToImage ??
                      'https://placehold.co/600x400/png?text=No+Image',
                ),

                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 269.w,

          child: Text(
            title ?? '',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
          ),
        ),
      ],
    );
  }
}

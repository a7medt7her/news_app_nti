import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: REdgeInsets.symmetric(horizontal: 4),
          width: 9.w,
          height: 9.h,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primary
                : AppColors.lightGray2,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

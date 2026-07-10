import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';

class AuthShape extends StatelessWidget {
  const AuthShape({
    super.key,
    required this.nameAuth,
    required this.publishedAt,
  });
  final String nameAuth;
  final String? publishedAt;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(publishedAt ?? '');
    String formattedDate = DateFormat('MMM d, yyyy', 'en').format(dateTime);

    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.black,
          ),
        ),
        SizedBox(width: 3.3.w),
        SizedBox(
          width: 150,
          child: Text(
            '$nameAuth · $formattedDate ',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}

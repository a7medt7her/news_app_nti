import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  static EdgeInsetsGeometry defaultPadding2(
    double? horizontal,
    double? vertical,
  ) {
    return REdgeInsets.symmetric(
      horizontal: horizontal ?? 32,
      vertical: vertical ?? 24,
    );
  }

  static EdgeInsetsGeometry defaultPadding = REdgeInsets.symmetric(
    horizontal: 32,
  );
  static EdgeInsetsGeometry articlesPadding = REdgeInsets.symmetric(
    vertical: 24,
  );
}

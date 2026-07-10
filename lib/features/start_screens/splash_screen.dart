import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/features/start_screens/let_start_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((v) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LetStartView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bardBlue,
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Center(
          child: Image.asset(AppAssetsImages.logo, width: 176.w, height: 50.h),
        ),
      ),
    );
  }
}

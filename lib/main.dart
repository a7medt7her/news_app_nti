import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';

import 'package:news_app_nti/features/start_screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.neutral,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.black,
            ),
            fontFamily: 'Inter',
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.bardBlue),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}

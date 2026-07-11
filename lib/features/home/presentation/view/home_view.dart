import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/helper/svg_helper.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/features/book_mark/presentation/view/book_mark_view.dart';
import 'package:news_app_nti/features/explor/presentation/view/explore_view.dart';
import 'package:news_app_nti/features/home/presentation/view/home_body.dart';
import 'package:news_app_nti/features/home/presentation/view_model/page_control/cubit/pages_cubit.dart';
import 'package:news_app_nti/features/weather/presentation/view/wearher_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

List<Widget> pages = [HomeBody(), ExploreView(), BookMarkView(), WeatherView()];

class _HomeState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagesCubit(),
      child: BlocBuilder<PagesCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: pages[state],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                context.read<PagesCubit>().changeIndex(value);
              },
              currentIndex: state,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: REdgeInsets.only(top: 15),
                    padding: REdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        svgHelper(AppAssetsIcons.whiteHome, 24.w, 24.h),
                        SizedBox(width: 7.w),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                  icon: Padding(
                    padding: REdgeInsets.only(top: 0),
                    child: svgHelper(AppAssetsIcons.blackHome, 24.w, 24.h),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: REdgeInsets.only(top: 15),
                    padding: REdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        svgHelper(AppAssetsIcons.whiteExplore, 24.w, 24.h),
                        SizedBox(width: 7.w),
                        Text(
                          'Explore',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                  icon: svgHelper(AppAssetsIcons.blackExplore, 24.w, 24.h),
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: REdgeInsets.only(top: 20),
                    padding: REdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        svgHelper(AppAssetsIcons.whiteBookmark, 24.w, 24.h),
                        SizedBox(width: 7.w),
                        Text(
                          'Bookmark',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                  icon: svgHelper(AppAssetsIcons.blackBookmark, 24.w, 24.h),
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: REdgeInsets.only(top: 20),
                    padding: REdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        svgHelper(AppAssetsIcons.whiteWeather, 24.w, 24.h),
                        SizedBox(width: 7.w),
                        Text(
                          'Weather',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                  icon: Padding(
                    padding: REdgeInsets.only(top: 10),
                    child: svgHelper(AppAssetsIcons.blackWeather, 24.w, 24.h),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

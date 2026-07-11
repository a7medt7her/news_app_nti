import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app_nti/core/helper/svg_helper.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/core/widgets/primary_button.dart';
import 'package:news_app_nti/features/weather/presentation/view_model/cubit/weather_cubit.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(30.5877893, 31.4798788),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: AppPadding.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning,\nAhmed Saber',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  Text(
                    DateFormat('EEE d MMMM, yyyy', 'en').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            actionsPadding: AppPadding.defaultPadding,
            actions: [
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is WeatherSuccess) {
                    String main =
                        state.weatherResponseModel.weather?.first.main ?? '';
                    return Row(
                      children: [
                        svgHelper(AppAssetsIcons.sun1, 32.w, 32.h),
                        SizedBox(width: 5.w),
                        Text(
                          '$main ${(state.weatherResponseModel.main!.temp! - 273.15).toStringAsFixed(1)}°C',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: AppColors.primaryText,
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is WeatherError) {
                    return Text(state.errorMassage);
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
          body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is WeatherError) {
                return Text(state.errorMassage);
              }
              if (state is WeatherSuccess) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: AppPadding.defaultPadding,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 29.h),
                            Text(
                              '${state.weatherResponseModel.name} - ${state.weatherResponseModel.sys?.country}',
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryText,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Row(
                              children: [
                                Text(
                                  ' ${(state.weatherResponseModel.main!.temp! - 273.15).toStringAsFixed(1)}°C',
                                  style: TextStyle(
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                Spacer(),
                                svgHelper(
                                  AppAssetsIcons.sun1,
                                  75.99629974365234.h,
                                  76.h,
                                ),
                              ],
                            ),
                            SizedBox(height: 31.h),
                            Text(
                              '${state.weatherResponseModel.weather?.first.main} - ${state.weatherResponseModel.weather?.first.description}',
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryText,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Text(
                              'Feels like   ${(state.weatherResponseModel.main!.feelsLike! - 273.15).toStringAsFixed(1)}°C',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondaryText,
                              ),
                            ),
                            SizedBox(height: 45.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 7.w),
                                Row(
                                  children: [
                                    svgHelper(
                                      AppAssetsIcons.temperature,
                                      21.265443801879883.w,
                                      41.020957946777344.h,
                                    ),
                                    SizedBox(width: 15.5.w),
                                    Column(
                                      children: [
                                        Text(
                                          '${(state.weatherResponseModel.main!.temp! - 273.15).toStringAsFixed(1)}°C',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          'celsius',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.secondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    svgHelper(
                                      AppAssetsIcons.pressure,
                                      21.265443801879883.w,
                                      41.020957946777344.h,
                                    ),
                                    SizedBox(width: 15.5.w),
                                    Column(
                                      children: [
                                        Text(
                                          '${state.weatherResponseModel.main!.pressure!} mp/h',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          'Pressure',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.secondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    svgHelper(
                                      AppAssetsIcons.uv,
                                      21.265443801879883.w,
                                      41.020957946777344.h,
                                    ),
                                    SizedBox(width: 15.5.w),
                                    Column(
                                      children: [
                                        Text(
                                          '${state.weatherResponseModel.main!.grndLevel}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          'UV Index',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.secondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    svgHelper(
                                      AppAssetsIcons.humidity,
                                      21.265443801879883.w,
                                      41.020957946777344.h,
                                    ),
                                    SizedBox(width: 15.5.w),
                                    Column(
                                      children: [
                                        Text(
                                          '${state.weatherResponseModel.main!.humidity!}%',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          'Humidity',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.secondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.w),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 52.h),
                          ],
                        ),
                        PrimaryButton(
                          text: 'Change Location',
                          sizedBoxWidth: 8.w,
                          widget: svgHelper(
                            AppAssetsIcons.location,
                            24.w,
                            24.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

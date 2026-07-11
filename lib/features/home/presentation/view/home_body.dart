import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app_nti/core/helper/svg_helper.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/core/widgets/articles_page.dart';

import 'package:news_app_nti/features/home/presentation/view/widgets/custom_Indicator.dart';
import 'package:news_app_nti/features/home/presentation/view/widgets/larg_card.dart';
import 'package:news_app_nti/features/home/presentation/view/widgets/median_card.dart';
import 'package:news_app_nti/features/home/presentation/view_model/everything/cubit/everything_cubit.dart';
import 'package:news_app_nti/features/home/presentation/view_model/page_control/cubit/pages_cubit.dart';
import 'package:news_app_nti/features/home/presentation/view_model/top_headlines_cubit/cubit/top_headlines_cubit.dart';
import 'package:news_app_nti/features/weather/presentation/view_model/cubit/weather_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TopHeadlinesCubit()..topHeadlines('a', '')),
        BlocProvider(
          create: (_) => EverythingCubit()..everything('a', 'popular'),
        ),
        BlocProvider(
          create: (_) => WeatherCubit()..getWeather(30.5877893, 31.4798788),
        ),
        BlocProvider(create: (_) => PagesCubit()),
      ],
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
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.defaultPadding,
            child: BlocBuilder<PagesCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: 24.h),
                    BlocBuilder<TopHeadlinesCubit, TopHeadlinesState>(
                      builder: (context, state) {
                        if (state is TopHeadlinesLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is TopHeadlinesSuccess) {
                          return SizedBox(
                            width: 376.w,
                            height: 274.h,
                            child: PageView.builder(
                              itemCount: 3,
                              onPageChanged: (index) {
                                context.read<PagesCubit>().changeIndex(index);
                              },
                              itemBuilder: (context, index) {
                                var data = state.topHeadlines.articles![index];

                                return LargCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ArticlesPage(
                                          title: data.title ?? '',
                                          description: data.description ?? '',
                                          imageUlr:
                                              data.urlToImage ??
                                              'https://placehold.co/600x400/png?text=No+Image',
                                          nameAuth: data.author ?? '',
                                          publishedAt: data.publishedAt ?? '',
                                          content: data.content ?? '',
                                        ),
                                      ),
                                    );
                                  },
                                  url:
                                      data.urlToImage ??
                                      'https://placehold.co/600x400/png?text=No+Image',
                                  title: data.title!,
                                  auth: data.source!.name!,
                                );
                              },
                            ),
                          );
                        }
                        if (state is TopHeadlinesError) {
                          return Text(state.errorMassage);
                        }
                        return SizedBox();
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomIndicator(currentIndex: state),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          'Most Popular',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryText,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See More',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 21.h),
                    BlocBuilder<EverythingCubit, EverythingState>(
                      builder: (context, state) {
                        if (state is EverythingLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is EverythingSuccess) {
                          return SizedBox(
                            height: 350.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var data = state.everything.articles![index];
                                return MedianCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ArticlesPage(
                                          title: data.title ?? '',
                                          description: data.description ?? '',
                                          imageUlr:
                                              data.urlToImage ??
                                              'https://placehold.co/600x400/png?text=No+Image',
                                          nameAuth: data.author ?? '',
                                          publishedAt: data.publishedAt ?? '',
                                          content: data.content ?? '',
                                        ),
                                      ),
                                    );
                                  },
                                  urlToImage: data.urlToImage,
                                  title: data.title,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 17.w);
                              },
                              itemCount: 5,
                            ),
                          );
                        }
                        if (state is EverythingError) {
                          return Center(child: Text(state.errorMassage));
                        }
                        return SizedBox();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

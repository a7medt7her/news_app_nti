import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/helper/svg_helper.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/core/widgets/articles_page.dart';
import 'package:news_app_nti/core/widgets/frame.dart';
import 'package:news_app_nti/features/home/presentation/view_model/everything/cubit/everything_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearched = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EverythingCubit(),
      child: Scaffold(
        appBar: isSearched
            ? AppBar(
                backgroundColor: AppColors.white,
                leading: Padding(
                  padding: AppPadding.defaultPadding,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: svgHelper(
                      AppAssetsIcons.blackArrow,
                      16.w,
                      10.275947570800781.h,
                    ),
                  ),
                ),
                title: Text(
                  'Search results',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                centerTitle: true,
              )
            : AppBar(
                backgroundColor: AppColors.white,
                automaticallyImplyLeading: false,
                title: BlocBuilder<EverythingCubit, EverythingState>(
                  builder: (context, state) {
                    return TextField(
                      onSubmitted: (value) {
                        setState(() {
                          isSearched = true;
                          context.read<EverythingCubit>().everything(value, '');
                        });
                      },
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: AppColors.lightGray2,
                        prefix: Padding(
                          padding: REdgeInsets.symmetric(horizontal: 10),
                          child: svgHelper(
                            AppAssetsIcons.search,
                            12.943069458007812.w,
                            12.946428298950195.h,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: AppColors.primary,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        suffix: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: svgHelper(
                            AppAssetsIcons.close,
                            14.666666984558105.w,
                            14.666666984558105.h,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
        body: isSearched
            ? Padding(
                padding: AppPadding.defaultPadding,
                child: BlocBuilder<EverythingCubit, EverythingState>(
                  builder: (context, state) {
                    if (state is EverythingLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is EverythingError) {
                      return Text(state.errorMassage);
                    }
                    if (state is EverythingSuccess) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.h),
                            SizedBox(
                              height: 40.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: REdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.bardBlue,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(56.r),
                                        ),
                                        border: Border.all(
                                          width: 1.w,
                                          color: AppColors.bardBlue,
                                        ),
                                      ),
                                      child: Text(
                                        'sport (${state.everything.totalResults})',
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 12.w);
                                },
                                itemCount: 5,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var articles =
                                    state.everything.articles?[index];
                                return Frame(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ArticlesPage(
                                          title: articles?.title ?? '',
                                          description:
                                              articles?.description ?? '',
                                          imageUlr:
                                              articles?.urlToImage ??
                                              'https://placehold.co/600x400/png?text=No+Image',
                                          nameAuth: articles?.author ?? '',
                                          publishedAt:
                                              articles?.publishedAt ?? '',
                                          content: articles?.content ?? '',
                                        ),
                                      ),
                                    );
                                  },
                                  title: articles?.title ?? '',
                                  nameAuth: articles?.author ?? '',
                                  publishedAt: articles?.publishedAt ?? '',
                                  imageUrl:
                                      articles?.urlToImage ??
                                      'https://placehold.co/600x400/png?text=No+Image',
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 24.h),
                              itemCount: 10,
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              )
            : SizedBox(),
      ),
    );
  }
}

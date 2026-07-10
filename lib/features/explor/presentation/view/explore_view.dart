import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/helper/svg_helper.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/core/widgets/articles_page.dart';
import 'package:news_app_nti/core/widgets/auth_shape.dart';
import 'package:news_app_nti/core/widgets/frame.dart';
import 'package:news_app_nti/features/explor/presentation/view/search_page.dart';
import 'package:news_app_nti/features/home/presentation/view_model/top_headlines_cubit/cubit/top_headlines_cubit.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopHeadlinesCubit()..topHeadlines('a', ''),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: AppPadding.defaultPadding,
            child: Text(
              "Explore",
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: AppPadding.defaultPadding,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                icon: svgHelper(AppAssetsIcons.search, 16.w, 16.h),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.defaultPadding,
            child: BlocBuilder<TopHeadlinesCubit, TopHeadlinesState>(
              builder: (context, state) {
                if (state is TopHeadlinesLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is TopHeadlinesSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 35.h,
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
                                child: Text('sport'),
                              ),
                            );
                          },
                          separatorBuilder: ((context, index) {
                            return SizedBox(width: 12.w);
                          }),
                          itemCount: 5,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticlesPage(
                                    title:
                                        state
                                            .topHeadlines
                                            .articles
                                            ?.first
                                            .title ??
                                        '',
                                    description:
                                        state
                                            .topHeadlines
                                            .articles
                                            ?.first
                                            .description ??
                                        '',
                                    imageUlr:
                                        state
                                            .topHeadlines
                                            .articles
                                            ?.first
                                            .urlToImage ??
                                        'https://placehold.co/600x400/png?text=No+Image',
                                    nameAuth:
                                        state
                                            .topHeadlines
                                            .articles
                                            ?.first
                                            .author ??
                                        '',
                                    publishedAt:
                                        state
                                            .topHeadlines
                                            .articles
                                            ?.first
                                            .publishedAt ??
                                        '',
                                    content:
                                        state
                                            .topHeadlines
                                            .articles
                                            ?.first
                                            .content ??
                                        '',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 366.w,
                              height: 206.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    state
                                            .topHeadlines
                                            .articles
                                            ?.first
                                            .urlToImage ??
                                        'https://placehold.co/600x400/png?text=No+Image',
                                  ),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.sp),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            state.topHeadlines.articles?.first.title ?? '',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryText,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          AuthShape(
                            nameAuth:
                                state.topHeadlines.articles?.first.author ?? '',
                            publishedAt:
                                state.topHeadlines.articles?.first.publishedAt,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var articles = state.topHeadlines.articles?[index];
                          return Frame(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticlesPage(
                                    title: articles?.title ?? '',
                                    description: articles?.description ?? '',
                                    imageUlr:
                                        articles?.urlToImage ??
                                        'https://placehold.co/600x400/png?text=No+Image',
                                    nameAuth: articles?.author ?? '',
                                    publishedAt: articles?.publishedAt ?? '',
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
                  );
                }
                if (state is TopHeadlinesError) {
                  return Text(state.errorMassage);
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

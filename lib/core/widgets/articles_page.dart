import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/helper/svg_helper.dart';
import 'package:news_app_nti/core/unitles/app_assets.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/core/widgets/auth_shape.dart';
import 'package:news_app_nti/core/widgets/frame.dart';
import 'package:news_app_nti/features/book_mark/presentation/view/book_mark_view.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUlr,
    required this.nameAuth,
    required this.publishedAt,
    required this.content,
  });
  final String title;
  final String description;
  final String imageUlr;
  final String nameAuth;
  final String publishedAt;
  final String content;

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

bool isBooked = false;

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 316.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.imageUlr),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: Offset(0, -30.h),
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: AppPadding.defaultPadding,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                        ),
                        color: AppColors.lightGray,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: svgHelper(
                              AppAssetsIcons.blackArrow,
                              16.w,
                              10.275947570800781.h,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isBooked = !isBooked;
                              });
                              isBooked
                                  ? bookMark.add(
                                      Frame(
                                        title: widget.title,
                                        nameAuth: widget.nameAuth,
                                        publishedAt: widget.publishedAt,
                                        imageUrl: widget.imageUlr,
                                      ),
                                    )
                                  : bookMark.remove(
                                      Frame(
                                        title: widget.title,
                                        nameAuth: widget.nameAuth,
                                        publishedAt: widget.publishedAt,
                                        imageUrl: widget.imageUlr,
                                      ),
                                    );
                            },
                            icon: isBooked
                                ? svgHelper(
                                    AppAssetsIcons.booked,
                                    15.941399574279785.w,
                                    20.h,
                                  )
                                : svgHelper(
                                    AppAssetsIcons.BookmarkIconly,
                                    15.941399574279785.w,
                                    20.h,
                                  ),
                          ),
                          SizedBox(width: 12.w),
                          IconButton(
                            onPressed: () {},
                            icon: svgHelper(
                              AppAssetsIcons.share,
                              15.941399574279785.w,
                              20.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),

                    Padding(
                      padding: AppPadding.defaultPadding,
                      child: Column(
                        children: [
                          Text(
                            widget.title,

                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryText,
                            ),
                          ),

                          SizedBox(height: 16.h),
                          AuthShape(
                            nameAuth: widget.nameAuth,
                            publishedAt: widget.publishedAt,
                          ),
                          SizedBox(height: 27.h),
                          Text(
                            widget.description,

                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryText,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            widget.content,

                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

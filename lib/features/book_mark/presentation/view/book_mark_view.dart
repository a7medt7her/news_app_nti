import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_nti/core/unitles/app_colors.dart';
import 'package:news_app_nti/core/unitles/app_padding.dart';
import 'package:news_app_nti/core/widgets/primary_button.dart';

List<Widget> bookMark = [];

class BookMarkView extends StatefulWidget {
  const BookMarkView({super.key});

  @override
  State<BookMarkView> createState() => _BookMarkViewState();
}

class _BookMarkViewState extends State<BookMarkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32.sp,
            color: AppColors.primaryText,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: bookMark.isEmpty
          ? Center(
              child: Text(
                'Empty',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
            )
          : Padding(
              padding: AppPadding.defaultPadding,
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Expanded(
                    child: ListView.separated(
                      itemCount: bookMark.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 24.h),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey(bookMark[index]),
                          direction: DismissDirection.startToEnd,

                          confirmDismiss: (direction) async {
                            final result = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  backgroundColor: AppColors.white,
                                  elevation: 10,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 24.h),

                                      Padding(
                                        padding: REdgeInsets.symmetric(
                                          horizontal: 25,
                                        ),
                                        child: Text(
                                          'Sure You want to delete this item?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryText,
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 31.h),

                                      Padding(
                                        padding: REdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: bookMark[index],
                                      ),

                                      SizedBox(height: 41.h),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          PrimaryButton(
                                            text: 'Yes, Delete',
                                            sizedBoxWidth: 0,
                                            onTap: () {
                                              Navigator.pop(
                                                dialogContext,
                                                true,
                                              );
                                            },
                                          ),
                                          SizedBox(width: 12.w),
                                          PrimaryButton(
                                            text: 'No',
                                            sizedBoxWidth: 0,
                                            onTap: () {
                                              Navigator.pop(
                                                dialogContext,
                                                false,
                                              );
                                            },
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                );
                              },
                            );

                            return result ?? false;
                          },

                          onDismissed: (direction) {
                            setState(() {
                              bookMark.removeAt(index);
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.primary,
                                content: Text(
                                  'Item deleted',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },

                          child: bookMark[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

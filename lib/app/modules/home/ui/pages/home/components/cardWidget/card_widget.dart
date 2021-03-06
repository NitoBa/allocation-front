import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class CardWidget extends StatelessWidget {
  final double? width;
  final double height;
  final String title;
  final Widget listData;
  final Widget? actionButton;
  final Widget? icon;
  const CardWidget({
    Key? key,
    required this.height,
    required this.title,
    required this.listData,
    this.icon,
    this.width,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 8,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.sp, vertical: 26.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    if (icon != null) ...[
                      SizedBox(width: 23.w),
                      icon!,
                    ]
                  ],
                ),
                actionButton ?? Container(),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.grayLightColor,
                  height: 1.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.sp),
          listData,
        ],
      ),
    );
  }
}

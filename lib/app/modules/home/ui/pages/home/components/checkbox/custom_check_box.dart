import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool value;
  const CustomCheckBox({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.titleColor,
            fontSize: 28.sp,
          ),
        ),
        SizedBox(width: 23.sp),
        InkWell(
          child: AnimatedContainer(
            duration: Duration(
              milliseconds: 100,
            ),
            height: 35.r,
            width: 35.r,
            decoration: BoxDecoration(
              color: value ? AppColors.orangeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
              border: value
                  ? null
                  : Border.all(
                      color: AppColors.grayLightColor,
                    ),
            ),
            child: value
                ? Icon(
                    AppIcons.check,
                    color: AppColors.whiteColor,
                    size: 24.sp,
                  )
                : null,
          ),
          onTap: onPressed,
        )
      ],
    );
  }
}

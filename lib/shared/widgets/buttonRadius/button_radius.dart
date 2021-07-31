import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class ButtonRadius extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color? hoverColor;
  final bool? isHover;
  const ButtonRadius({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.hoverColor,
    this.isHover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.sp,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.orangeColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: AppColors.whiteColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.w400,
              ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

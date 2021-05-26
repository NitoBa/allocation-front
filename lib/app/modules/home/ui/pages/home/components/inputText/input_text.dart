import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class InputText extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool? autoFocus;
  final void Function(String text)? onChangeText;
  const InputText({
    Key? key,
    required this.placeholder,
    this.autoFocus = false,
    this.controller,
    this.onChangeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      child: TextField(
        autofocus: autoFocus!,
        cursorColor: AppColors.titleColor,
        style: TextStyle(
          color: AppColors.titleColor,
          fontSize: 22.sp,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 30.sp,
            vertical: 0,
          ),
          hintText: placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColors.orangeColor),
          ),
        ),
        onChanged: onChangeText,
      ),
    );
  }
}

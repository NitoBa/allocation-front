import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  const Button({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.sp,
      width: 180.sp,
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
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
        ),
        child: Text(
          'Enviar',
          style: TextStyle(
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

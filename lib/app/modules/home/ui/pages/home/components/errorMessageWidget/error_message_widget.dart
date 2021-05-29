import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class ErrorMessageWidget extends StatelessWidget {
  final Function() onPressed;
  final String message;
  const ErrorMessageWidget({
    Key? key,
    required this.onPressed,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 25.sp,
            ),
          ),
          SizedBox(height: 15.sp),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.orangeColor),
            ),
            onPressed: onPressed,
            child: Text(
              "Try again",
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

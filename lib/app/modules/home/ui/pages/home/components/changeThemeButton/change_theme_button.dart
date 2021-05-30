import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/app_icons.dart';

class ChangeThemeButton extends StatelessWidget {
  final Function() onPressed;

  const ChangeThemeButton({Key? key, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        fixedSize: MaterialStateProperty.all(Size(70.sp, 47.sp)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
      ),
      child: Icon(
        AppIcons.sun,
        color: Theme.of(context).scaffoldBackgroundColor,
        size: 24.sp,
      ),
      onPressed: onPressed,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Allocation Dashboard',
        theme: AppTheme.darkTheme,
      ).modular(),
    );
  }
}

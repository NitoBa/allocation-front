import 'package:allocation_front/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../shared/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      builder: () => RxBuilder(
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Allocation Dashboard',
          theme: Modular.get<AppController>().changeThemeStore.isDarkMode
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
        ).modular(),
      ),
    );
  }
}

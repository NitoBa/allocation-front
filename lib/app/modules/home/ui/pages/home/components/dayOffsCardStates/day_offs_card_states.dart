import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../../controllers/home_controller.dart';
import '../../stores/get_day_off_store.dart';
import '../cardWidget/card_widget.dart';
import '../dayOffsList/day_offs_list.dart';
import '../errorMessageWidget/error_message_widget.dart';
import '../insertButton/insert_button.dart';

class DayOffsCardState extends StatelessWidget {
  final HomeController controller;
  final Function() insertDayOff;

  const DayOffsCardState({
    Key? key,
    required this.controller,
    required this.insertDayOff,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        switch (controller.getDayOffStore.state) {
          case GetDayOffState.error:
            return Container(
              height: 372.sp,
              child: ErrorMessageWidget(
                message: controller.getDayOffStore.errorMessage,
                onPressed: () => controller.getAllDayOffs(),
              ),
            );
          case GetDayOffState.loading:
            return Container(
              height: 372.sp,
              child: Center(
                child: Lottie.asset(
                  AppAnimations.loading,
                  repeat: true,
                  height: 300.r,
                  width: 300.r,
                ),
              ),
            );
          case GetDayOffState.empty:
            return Container(
              height: 372.sp,
              alignment: Alignment.center,
              child: Text(
                "Nenhum day off encontrado",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 25.sp,
                ),
              ),
            );
          case GetDayOffState.sucess:
            return CardWidget(
              height: 372.sp,
              title: "DAY OFFS",
              actionButton: InsertButton(onPressed: insertDayOff),
              listData: DaysOffsList(
                dayOffs: controller.getDayOffStore.dayOffs,
              ),
            );
          case GetDayOffState.idle:
            return Container(
              height: 372.sp,
              child: Center(
                child: Lottie.asset(
                  AppAnimations.loading,
                  repeat: true,
                  height: 300.r,
                  width: 300.r,
                ),
              ),
            );
        }
      },
    );
  }
}

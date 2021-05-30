import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../../controllers/home_controller.dart';
import '../../stores/get_allocations_store.dart';
import '../allocationList/allocation_list.dart';
import '../cardWidget/card_widget.dart';
import '../errorMessageWidget/error_message_widget.dart';
import '../insertButton/insert_button.dart';

class AllocationCardStates extends StatelessWidget {
  final HomeController controller;
  final Function() insertAllocation;

  const AllocationCardStates(
      {Key? key, required this.controller, required this.insertAllocation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      switch (controller.getAllocationsStore.state) {
        case GetAllocationState.error:
          return Container(
            height: 420.sp,
            child: ErrorMessageWidget(
              message: controller.getAllocationsStore.errorMessage,
              onPressed: () => controller.getAllAllocations(),
            ),
          );
        case GetAllocationState.loading:
          return Container(
            height: 420.sp,
            child: Center(
              child: Lottie.asset(
                AppAnimations.loading,
                repeat: true,
                height: 300.r,
                width: 300.r,
              ),
            ),
          );
        case GetAllocationState.empty:
          return Container(
            height: 420.sp,
            alignment: Alignment.center,
            child: Text(
              "Nenhum alocação encontrada",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 25.sp,
              ),
            ),
          );
        case GetAllocationState.sucess:
          return CardWidget(
            height: 420.sp,
            title: "ALLOCATION",
            icon: Container(
              width: 77.sp,
              height: 37.sp,
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(
                AppIcons.arrowUp,
                size: 24.sp,
                color: AppColors.whiteColor,
              ),
            ),
            actionButton: InsertButton(onPressed: insertAllocation),
            listData: AllocationList(
              allocations: controller.getAllocationsStore.allocations,
            ),
          );
        case GetAllocationState.idle:
          return Container(
            height: 420.sp,
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
    });
  }
}

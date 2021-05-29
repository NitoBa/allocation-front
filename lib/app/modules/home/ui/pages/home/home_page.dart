import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../shared/constants/app_constants.dart';
import '../../../../../../shared/theme/theme.dart';
import 'components/Button/button.dart';
import 'components/allocationCardStates/allocation_card_states.dart';
import 'components/checkbox/custom_check_box.dart';
import 'components/datePicker/date_picker.dart';
import 'components/dayOffsCardStates/day_offs_card_states.dart';
import 'components/inputDropdown/input_dropdown.dart';
import 'components/inputText/input_text.dart';
import 'components/projectResumesState/project_resumes_states.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getAllAllocations();
    controller.getAllDayOffs();
    controller.getProjectResumes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 98.sp, vertical: 50.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Allocation Dashboard',
                  style: TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 32.sp,
                  ),
                ),
                SizedBox(width: 14.w),
                Icon(
                  AppIcons.arrowDown,
                  color: AppColors.whiteColor,
                  size: 20.sp,
                ),
              ],
            ),
            SizedBox(height: 54.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AllocationCardStates(
                  controller: controller,
                  insertAllocation: () {
                    showInsertDialog(
                      context,
                      title: "Inserir Alocação",
                      content: Container(
                        child: Column(
                          children: [
                            InputDropdown(
                              placeholder: 'Nome',
                              items: AppConstants.devs,
                              onChanged: (item) {},
                            ),
                            SizedBox(height: 20.sp),
                            InputDropdown(
                              placeholder: 'Projeto',
                              items: AppConstants.projects,
                              onChanged: (item) {},
                            ),
                            SizedBox(height: 20.sp),
                            InputDropdown(
                              placeholder: 'Horas',
                              items: AppConstants.hours,
                              onChanged: (item) {},
                            ),
                            SizedBox(height: 20.sp),
                            InputText(
                              placeholder: "Observação opcional",
                              onChangeText: (text) {},
                            ),
                            SizedBox(height: 80.sp),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Button(
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                      onCloseModal: () {},
                    );
                  },
                ),
                SizedBox(height: 30.sp),
                Row(
                  children: [
                    SizedBox(height: 30.sp),
                    Expanded(
                      child: DayOffsCardState(
                        controller: controller,
                        insertDayOff: () {
                          showInsertDialog(
                            context,
                            title: "Inserir day off",
                            content: Container(
                              child: Column(
                                children: [
                                  InputDropdown(
                                    placeholder: 'Nome',
                                    items: AppConstants.devs,
                                    onChanged: (item) {},
                                  ),
                                  SizedBox(height: 20.sp),
                                  DatePickerWidget(),
                                  SizedBox(height: 40.sp),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Você gostaria de:',
                                          style: TextStyle(
                                            color: AppColors.titleColor,
                                            fontSize: 28.sp,
                                          ),
                                        ),
                                        SizedBox(height: 13.sp),
                                        RxBuilder(
                                          builder: (_) => CustomCheckBox(
                                            title: 'Inserir:',
                                            value: controller.insertDayOffStore
                                                        .isCheckedBox ==
                                                    "Inserir"
                                                ? true
                                                : false,
                                            onPressed: () => controller
                                                .insertDayOffStore
                                                .handleCheckBox("Inserir"),
                                          ),
                                        ),
                                        SizedBox(height: 13.sp),
                                        RxBuilder(
                                          builder: (_) => CustomCheckBox(
                                            title: 'Retirar:',
                                            value: controller.insertDayOffStore
                                                        .isCheckedBox ==
                                                    "Retirar"
                                                ? true
                                                : false,
                                            onPressed: () => controller
                                                .insertDayOffStore
                                                .handleCheckBox("Retirar"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Button(
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onCloseModal: () {},
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 20.sp),
                    Expanded(
                      child: ProjectResumesState(
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showInsertDialog(
    BuildContext context, {
    required Widget content,
    required Function onCloseModal,
    required String title,
  }) {
    return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              width: 700.r,
              padding: EdgeInsets.symmetric(
                horizontal: 57.sp,
                vertical: 53.sp,
              ),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: 32.sp,
                        ),
                      ),
                      SizedBox(width: 12.sp),
                      Icon(
                        AppIcons.arrowDown,
                        size: 24.sp,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 55.sp),
                  content
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() => onCloseModal());
  }
}

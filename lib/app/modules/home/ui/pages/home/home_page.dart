import 'dart:ui';

import 'package:allocation_front/app/modules/home/ui/pages/home/components/actionCard/action_card.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../shared/constants/app_constants.dart';
import '../../../../../../shared/theme/theme.dart';
import 'components/Button/button.dart';
import 'components/allocationList/allocation_list.dart';
import 'components/cardWidget/card_widget.dart';
import 'components/checkbox/custom_check_box.dart';
import 'components/datePicker/date_picker.dart';
import 'components/dayOffsList/day_offs_list.dart';
import 'components/inputDropdown/input_dropdown.dart';
import 'components/inputText/input_text.dart';
import 'components/insertButton/insert_button.dart';
import 'components/summaryList/sumaryList.dart';
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
  Widget build(BuildContext context) {
    print(AppConstants.baseUrl);
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
            controller.list.isNotEmpty
                ? Expanded(
                    child: Center(
                      child: Lottie.asset(
                        AppAnimations.loading,
                        repeat: true,
                        height: 300.r,
                        width: 300.r,
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardWidget(
                        height: 420.sp,
                        title: "ALLOCATION",
                        icon: Container(
                          width: 77.sp,
                          height: 37.sp,
                          decoration: BoxDecoration(
                            color: AppColors.orangeColor,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Icon(AppIcons.arrowUp, size: 24.sp),
                        ),
                        actionButton: InsertButton(onPressed: () {
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
                        }),
                        listData: AllocationList(),
                      ),
                      SizedBox(height: 30.sp),
                      Row(
                        children: [
                          Expanded(
                            child: CardWidget(
                              height: 372.sp,
                              title: "DAY OFFS",
                              actionButton: InsertButton(onPressed: () {
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
                                                  value: controller
                                                              .insertDayOffStore
                                                              .isCheckedBox ==
                                                          "Inserir"
                                                      ? true
                                                      : false,
                                                  onPressed: () => controller
                                                      .insertDayOffStore
                                                      .handleCheckBox(
                                                          "Inserir"),
                                                ),
                                              ),
                                              SizedBox(height: 13.sp),
                                              RxBuilder(
                                                builder: (_) => CustomCheckBox(
                                                  title: 'Retirar:',
                                                  value: controller
                                                              .insertDayOffStore
                                                              .isCheckedBox ==
                                                          "Retirar"
                                                      ? true
                                                      : false,
                                                  onPressed: () => controller
                                                      .insertDayOffStore
                                                      .handleCheckBox(
                                                          "Retirar"),
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
                              }),
                              listData: DaysOffsList(),
                            ),
                          ),
                          SizedBox(width: 20.sp),
                          Expanded(
                            child: CardWidget(
                              height: 372.sp,
                              title: "SUMMARY",
                              actionButton: ActionCard(
                                onPressed: () {},
                                title: "Total",
                                description: "400",
                                color: AppColors.orangeColor,
                              ),
                              listData: SummaryList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
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

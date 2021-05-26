import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  String dateSelected = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectDate(context);
      },
      child: Container(
        height: 100.sp,
        padding: EdgeInsets.symmetric(
          horizontal: 23.sp,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grayLightColor,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateSelected.isEmpty ? "Data (opcional)" : dateSelected,
                style: TextStyle(
                  color: dateSelected.isEmpty
                      ? AppColors.grayLightColor
                      : AppColors.titleColor,
                  fontSize: 26.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  selectDate(context);
                },
                child: Container(
                  height: 65.r,
                  width: 65.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3.sp,
                      color: AppColors.grayLightColor,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      AppIcons.dateTicker,
                      size: 28.sp,
                      color: AppColors.grayLightColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (_, child) {
        return Theme(
          data: AppTheme.darkTheme.copyWith(
            dialogBackgroundColor: AppColors.foregroundColor,
            colorScheme: ColorScheme.light(
              primary: AppColors.orangeColor,
              onPrimary: AppColors.whiteColor,
              onSurface: AppColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (result != null) {
      String month = result.month.toString().padLeft(2, '0');
      String day = result.day.toString().padLeft(2, '0');
      setState(() {
        dateSelected = "${result.year}-$month-$day";
      });
    }
  }
}

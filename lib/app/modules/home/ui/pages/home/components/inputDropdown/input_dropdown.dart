import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class InputDropdown extends StatefulWidget {
  final List<String> items;
  final String placeholder;
  final void Function(String? item) onChanged;
  const InputDropdown({
    Key? key,
    required this.items,
    required this.placeholder,
    required this.onChanged,
  }) : super(key: key);

  @override
  _InputDropdownState createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // this InkWell is to only show hightlight and cursor pointer
      onTap: () {},
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
          child: DropdownButton<String>(
            icon: Icon(
              AppIcons.arrowDown,
              size: 24.sp,
            ),
            style: TextStyle(
              color: AppColors.titleColor,
              fontSize: 26.sp,
            ),
            dropdownColor: AppColors.backgroundColor,
            isExpanded: true,
            underline: Container(),
            items: widget.items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            hint: Text(
              widget.placeholder,
              style: TextStyle(
                color: AppColors.grayLightColor,
                fontSize: 26.sp,
              ),
            ),
            value: selectedValue,
            onChanged: (item) {
              setState(() {
                selectedValue = item;
              });
              widget.onChanged(selectedValue);
            },
          ),
        ),
      ),
    );
  }
}

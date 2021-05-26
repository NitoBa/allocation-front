import 'package:allocation_front/app/modules/home/ui/pages/home/components/insertButton/insert_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionCard extends InsertButton {
  final void Function() onPressed;
  final String title;
  final String description;
  final Color color;
  ActionCard({
    required this.onPressed,
    required this.title,
    required this.description,
    required this.color,
  }) : super(
          onPressed: onPressed,
          title: title,
          description: description,
          colorButton: color,
          hasHover: false,
          width: 200.sp,
        );
}

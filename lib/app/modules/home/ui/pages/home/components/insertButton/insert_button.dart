import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class InsertButton extends StatefulWidget {
  final void Function() onPressed;
  final Color colorButton;
  final String description;
  final String? title;
  final double? width;
  final bool hasHover;
  const InsertButton({
    Key? key,
    required this.onPressed,
    this.colorButton = AppColors.grayLightColor,
    this.description = 'Inserir',
    this.title,
    this.width,
    this.hasHover = true,
  }) : super(key: key);

  @override
  _InsertButtonState createState() => _InsertButtonState();
}

class _InsertButtonState extends State<InsertButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      width: widget.width ?? 241.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grayLightColor,
          width: 1.sp,
        ),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 5.5.sp),
        child: Row(
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: isHover ? 0.5 : 1,
              child: Container(
                height: 40.sp,
                width: 105.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: widget.colorButton,
                ),
                child: InkWell(
                  onHover: widget.hasHover
                      ? (hover) {
                          setState(() {
                            isHover = hover;
                          });
                        }
                      : null,
                  borderRadius: BorderRadius.circular(50.r),
                  onTap: widget.onPressed,
                  child: widget.title != null
                      ? Center(
                          child: Text(
                            widget.title!,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        )
                      : Icon(
                          AppIcons.plus,
                          size: 24.sp,
                          color: AppColors.whiteColor,
                        ),
                ),
              ),
            ),
            Spacer(),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.headline6,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

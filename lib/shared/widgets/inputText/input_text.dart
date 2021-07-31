import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class InputText extends StatefulWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool? autoFocus;
  final String? label;
  final TextStyle? labelStyle;
  final bool isPassword;
  final void Function(String text)? onChangeText;
  const InputText({
    Key? key,
    required this.placeholder,
    this.autoFocus = false,
    this.controller,
    this.onChangeText,
    this.label,
    this.labelStyle,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool isPassword = false;
  @override
  void initState() {
    isPassword = widget.isPassword;
    super.initState();
  }

  void togglePassword() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: widget.labelStyle),
          SizedBox(
            height: 8.r,
          )
        ],
        Container(
          height: 80.sp,
          child: TextField(
            obscureText: isPassword,
            autofocus: widget.autoFocus!,
            cursorColor: AppColors.titleColor,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 22.sp,
            ),
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? InkWell(
                      child: Icon(
                        isPassword ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: togglePassword,
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 30.sp,
                vertical: 0,
              ),
              hintText: widget.placeholder,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: AppColors.orangeColor),
              ),
            ),
            onChanged: widget.onChangeText,
          ),
        ),
      ],
    );
  }
}

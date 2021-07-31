import 'dart:ui';

import 'package:allocation_front/shared/widgets/buttonRadius/button_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/theme/app_colors.dart';
import '../../../../../../shared/widgets/inputText/input_text.dart';
import 'controllers/sing_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Stack(
                children: [
                  Positioned(
                    top: -130.r,
                    left: -220.r,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        height: 970.r,
                        width: 970.r,
                        decoration: BoxDecoration(
                          color: Color(0xffF4F4F4).withOpacity(0.1),
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 47.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create your account",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 114.r,
                          ),
                        ),
                        SizedBox(height: 6.r),
                        Row(
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                            InkWell(
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: AppColors.orangeColor),
                              ),
                              onTap: () {
                                Modular.to.pushReplacementNamed('/signin');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 88.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText(
                    label: "Username",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    placeholder: "Your username",
                    onChangeText: (text) {},
                  ),
                  SizedBox(height: 44.sp),
                  InputText(
                    label: "Email",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    placeholder: "Your email",
                    onChangeText: (text) {},
                  ),
                  SizedBox(height: 44.sp),
                  InputText(
                    isPassword: true,
                    label: "Password",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    placeholder: "Your password",
                    onChangeText: (text) {},
                  ),
                  Text(
                    'Min. 6 characters including 1 special, 1 uppercase letter and 1 number.',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 80.sp),
                  ButtonRadius(
                    onPressed: () {},
                    text: "Create account",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

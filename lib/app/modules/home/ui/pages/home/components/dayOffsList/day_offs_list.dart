import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../informationItem/informationItem.dart';

class DaysOffsList extends StatelessWidget {
  const DaysOffsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (item, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
              vertical: 12.sp,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.white12,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 15.r,
                    width: 15.r,
                    decoration: BoxDecoration(
                      color: AppColors.orangeColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 60.sp),
                  InformationItem(
                    photoUrl: 'https://github.com/Nitoba.png',
                    title: 'Nome',
                    subtitle: 'Bruno Alves',
                  ),
                  SizedBox(width: 50.sp),
                  InformationItem(
                    hasIconLeading: true,
                    title: 'Saldo',
                    subtitle: '13',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

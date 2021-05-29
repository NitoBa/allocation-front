import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../../../../../domain/entities/day_off_item_entity.dart';
import '../informationItem/informationItem.dart';

class DaysOffsList extends StatelessWidget {
  final List<DayOffItemEntity> dayOffs;
  const DaysOffsList({
    Key? key,
    required this.dayOffs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: dayOffs.length,
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
                    photoUrl: dayOffs[index].photoUrl,
                    title: 'Nome',
                    subtitle: dayOffs[index].userName,
                  ),
                  SizedBox(width: 50.sp),
                  InformationItem(
                    hasIconLeading: true,
                    title: 'Saldo',
                    subtitle: dayOffs[index].amount,
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

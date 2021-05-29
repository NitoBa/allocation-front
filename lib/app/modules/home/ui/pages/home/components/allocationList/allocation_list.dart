import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../../../../../domain/entities/allocation_item_entity.dart';
import '../informationItem/informationItem.dart';

class AllocationList extends StatelessWidget {
  final List<AllocationItemEntity> allocations;
  const AllocationList({
    Key? key,
    required this.allocations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: allocations.length,
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
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: AppColors.titleColor,
                      fontSize: 32.sp,
                    ),
                  ),
                  SizedBox(width: 60.sp),
                  InformationItem(
                    photoUrl: allocations[index].photoUrl,
                    title: 'Nome',
                    subtitle: allocations[index].userName,
                  ),
                  SizedBox(width: 50.sp),
                  InformationItem(
                    title: 'Data',
                    subtitle: allocations[index].date,
                  ),
                  SizedBox(width: 50.sp),
                  InformationItem(
                    title: 'Projeto',
                    subtitle: allocations[index].project,
                  ),
                  SizedBox(width: 50.sp),
                  InformationItem(
                    title: 'Horas',
                    subtitle: allocations[index].hours,
                  ),
                  SizedBox(width: 50.sp),
                  InformationItem(
                    title: 'Observação',
                    subtitle: allocations[index].observation,
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

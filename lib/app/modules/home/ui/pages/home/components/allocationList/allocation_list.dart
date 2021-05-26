import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../informationItem/informationItem.dart';

class AllocationList extends StatelessWidget {
  const AllocationList({
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
              vertical: 30.sp,
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
                  photoUrl: 'https://github.com/Nitoba.png',
                  title: 'Nome',
                  subtitle: 'Bruno Alves',
                ),
                SizedBox(width: 50.sp),
                InformationItem(
                  title: 'Data',
                  subtitle: '07/05/2021',
                ),
                SizedBox(width: 50.sp),
                InformationItem(
                  title: 'Projeto',
                  subtitle: 'Artbit',
                ),
                SizedBox(width: 50.sp),
                InformationItem(
                  title: 'Horas',
                  subtitle: '8',
                ),
                SizedBox(width: 50.sp),
                InformationItem(
                  title: 'Observação',
                  subtitle: 'Nova tela de login com firebase',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

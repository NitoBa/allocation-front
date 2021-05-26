import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../informationItem/informationItem.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({
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
                InformationItem(
                  hasIconLeading: true,
                  title: 'Projeto',
                  subtitle: 'Artbit',
                ),
                SizedBox(width: 50.sp),
                InformationItem(
                  hasIconLeading: true,
                  title: 'Horas',
                  subtitle: '400',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

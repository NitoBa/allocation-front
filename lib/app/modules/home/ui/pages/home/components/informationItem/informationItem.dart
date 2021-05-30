import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/theme/theme.dart';

class InformationItem extends StatelessWidget {
  final String? photoUrl;
  final bool hasIconLeading;
  final String title;
  final String subtitle;
  const InformationItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.photoUrl,
    this.hasIconLeading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (hasIconLeading) ...[
            Container(
              height: 15.r,
              width: 15.r,
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10.sp)
          ],
          Container(
            height: 27.sp,
            width: 1.sp,
            color: AppColors.grayLightColor,
          ),
          SizedBox(width: 16.sp),
          if (photoUrl != null) ...[
            Container(
              height: 60.r,
              width: 60.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    photoUrl!,
                  ),
                ),
              ),
            ),
            SizedBox(width: 25.sp),
          ],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 6.sp),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 300.sp,
                ),
                child: Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

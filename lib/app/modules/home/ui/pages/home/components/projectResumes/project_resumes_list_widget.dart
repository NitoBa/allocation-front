import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/project_resume_entity.dart';
import '../informationItem/informationItem.dart';

class ProjectResumesList extends StatelessWidget {
  final List<ProjectResumeEntity> projectResumes;
  const ProjectResumesList({
    Key? key,
    required this.projectResumes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: projectResumes.length - 1,
        itemBuilder: (item, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
              vertical: 12.sp,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.white12,
                ),
              ),
              child: Row(
                children: [
                  InformationItem(
                    hasIconLeading: true,
                    title: 'Projeto',
                    subtitle: projectResumes[index].projectName,
                  ),
                  SizedBox(width: 50.sp),
                  InformationItem(
                    hasIconLeading: true,
                    title: 'Horas',
                    subtitle: projectResumes[index].hours,
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../../shared/theme/theme.dart';
import '../../controllers/home_controller.dart';
import '../../stores/get_project_resumes_store.dart';
import '../actionCard/action_card.widget.dart';
import '../cardWidget/card_widget.dart';
import '../errorMessageWidget/error_message_widget.dart';
import '../projectResumes/project_resumes_list_widget.dart';

class ProjectResumesState extends StatelessWidget {
  final HomeController controller;

  const ProjectResumesState({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      switch (controller.getProjectResumeStore.state) {
        case GetProjectResumeState.error:
          return Container(
            height: 372.sp,
            child: ErrorMessageWidget(
              onPressed: () => controller.getProjectResumes(),
              message: controller.getProjectResumeStore.errorMessage,
            ),
          );
        case GetProjectResumeState.loading:
          return Container(
            height: 372.sp,
            child: Center(
              child: Lottie.asset(
                AppAnimations.loading,
                repeat: true,
                height: 300.r,
                width: 300.r,
              ),
            ),
          );
        case GetProjectResumeState.empty:
          return Container(
            height: 372.sp,
            alignment: Alignment.center,
            child: Text(
              "Não há resumos encontrados",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 25.sp,
              ),
            ),
          );
        case GetProjectResumeState.sucess:
          return CardWidget(
            height: 372.sp,
            title: "PROJECT RESUMES",
            actionButton: ActionCard(
              onPressed: () {},
              title: "Total",
              description:
                  controller.getProjectResumeStore.projectResumes.last.hours,
              color: AppColors.orangeColor,
            ),
            listData: ProjectResumesList(
              projectResumes: controller.getProjectResumeStore.projectResumes,
            ),
          );
        case GetProjectResumeState.idle:
          return Container(
            height: 372.sp,
            child: Center(
              child: Lottie.asset(
                AppAnimations.loading,
                repeat: true,
                height: 300.r,
                width: 300.r,
              ),
            ),
          );
      }
    });
  }
}

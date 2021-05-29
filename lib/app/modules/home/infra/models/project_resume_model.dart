import 'package:allocation_front/app/modules/home/domain/entities/project_resume_entity.dart';

class ProjectResumeModel extends ProjectResumeEntity {
  ProjectResumeModel({
    required String projectName,
    required String hours,
  }) : super(projectName: projectName, hours: hours);

  factory ProjectResumeModel.fromJson(Map<String, dynamic> json) {
    return ProjectResumeModel(
      projectName: json['name'],
      hours: json['hours'].toString(),
    );
  }
}

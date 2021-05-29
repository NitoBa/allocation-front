import 'package:allocation_front/shared/constants/app_constants.dart';

import '../../domain/entities/allocation_item_entity.dart';

class AllocationItemModel extends AllocationItemEntity {
  AllocationItemModel({
    required int id,
    required String photoUrl,
    required String userName,
    required String project,
    required String hours,
    required String observation,
    required String date,
  }) : super(
          id: id,
          photoUrl: photoUrl,
          userName: userName,
          project: project,
          hours: hours,
          observation: observation,
          date: date,
        );

  factory AllocationItemModel.fromJson(Map<String, dynamic> json) {
    String formatDate(String date) {
      final dateTime = DateTime.tryParse(date)?.toLocal();

      return "${dateTime?.day.toString().padLeft(2, '0')}/${dateTime?.month.toString().padLeft(2, '0')}/${dateTime?.year}";
    }

    return AllocationItemModel(
      id: json['id'],
      photoUrl: AppConstants.avatarUsers[json['userName']] ??
          AppConstants.avatarUrlGeneric,
      userName: json['userName'],
      date: formatDate(json['date']),
      project: json['project'],
      hours: json['timeAllocation'].toString(),
      observation: json['obs'],
    );
  }
}

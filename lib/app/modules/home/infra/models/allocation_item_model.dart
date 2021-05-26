import '../../domain/entities/allocation_item_entity.dart';

class AllocationItemModel extends AllocationItemEntity {
  AllocationItemModel({
    required String photoUrl,
    required String userName,
    required String project,
    required String hours,
    required String observation,
  }) : super(
          photoUrl: photoUrl,
          userName: userName,
          project: project,
          hours: hours,
          observation: observation,
        );

  factory AllocationItemModel.fromJson(Map<String, dynamic> json) {
    return AllocationItemModel(
      photoUrl: json['key'],
      userName: json['key'],
      project: json['key'],
      hours: json['key'],
      observation: json['key'],
    );
  }
}

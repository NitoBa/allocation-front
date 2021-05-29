import 'package:allocation_front/shared/constants/app_constants.dart';

import '../../domain/entities/day_off_item_entity.dart';

class DayOffItemModel extends DayOffItemEntity {
  DayOffItemModel({
    required String photoUrl,
    required String userName,
    required String amount,
  }) : super(
          photoUrl: photoUrl,
          userName: userName,
          amount: amount,
        );

  factory DayOffItemModel.fromJson(Map<String, dynamic> json) {
    return DayOffItemModel(
      photoUrl: AppConstants.avatarUsers[json['userName']] ??
          AppConstants.avatarUrlGeneric,
      userName: json['userName'],
      amount: json['amount'].toString(),
    );
  }
}

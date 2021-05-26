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
      photoUrl: json['key'],
      userName: json['key'],
      amount: json['key'],
    );
  }
}

import 'package:rx_notifier/rx_notifier.dart';

import '../../../../domain/entities/day_off_item_entity.dart';
import '../../../../domain/usecases/get_day_offs.dart';

enum GetDayOffState {
  idle,
  loading,
  sucess,
  empty,
  error,
}

class GetDayOffStore {
  final IGetDayOffs _usecase;
  List<DayOffItemEntity> _dayOffs = [];
  var _state = RxNotifier<GetDayOffState>(GetDayOffState.idle);
  GetDayOffState get state => _state.value;
  List<DayOffItemEntity> get dayOffs => _dayOffs;

  String errorMessage = '';

  GetDayOffStore(this._usecase);

  Future<void> call() async {
    _state.value = GetDayOffState.loading;

    final result = await _usecase();

    result.fold((l) {
      _state.value = GetDayOffState.error;
      errorMessage = l.message;
    }, (r) {
      if (r.isEmpty) {
        _state.value = GetDayOffState.empty;
        return;
      }
      _state.value = GetDayOffState.sucess;
      _dayOffs = r;
    });
  }
}

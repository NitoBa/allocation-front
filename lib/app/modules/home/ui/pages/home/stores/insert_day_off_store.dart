import 'package:rx_notifier/rx_notifier.dart';

class InsertDayOffStore {
  RxNotifier<String> _insertDayOffCheckbox = RxNotifier('');
  String get isCheckedBox => _insertDayOffCheckbox.value;

  void handleCheckBox(String value) => _insertDayOffCheckbox.value = value;
}

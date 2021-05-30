import 'package:rx_notifier/rx_notifier.dart';

class AppController {
  RxNotifier<bool> _isDarkMode = RxNotifier<bool>(true);
  bool get isDarkMode => _isDarkMode.value;

  toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
  }
}

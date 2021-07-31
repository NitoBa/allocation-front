import 'package:allocation_front/shared/constants/app_constants.dart';
import 'package:allocation_front/shared/services/localStorage/ilocal_storage.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ChangeThemeStore {
  ChangeThemeStore(this._localStorage) {
    _getStorageTheme();
  }

  final ILocalStorage _localStorage;
  RxNotifier<bool> _isDarkMode = RxNotifier<bool>(true);
  bool get isDarkMode => _isDarkMode.value;

  Future<void> _getStorageTheme() async {
    final result =
        await _localStorage.getItem(AppConstants.storageThemeKey) ?? false;
    _isDarkMode.value = result;
  }

  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    await _localStorage.insert<bool>(AppConstants.storageThemeKey, isDarkMode);
  }
}

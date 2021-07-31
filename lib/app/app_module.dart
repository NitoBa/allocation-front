import '../shared/services/localStorage/shared_preferences.dart';
import '../shared/stores/change_theme_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/http_client/client_interface.dart';
import '../shared/http_client/custom_dio/dio_client.dart';
import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // global controller the app
    Bind.singleton((i) => AppController(i())),
    // dio client http instance
    Bind.lazySingleton<IClientHttp>((i) => DioClient()),
    // global stores
    Bind.lazySingleton((i) => ChangeThemeStore(i())),
    // local storage implementation
    Bind.lazySingleton((i) => SharedPreferencesImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}

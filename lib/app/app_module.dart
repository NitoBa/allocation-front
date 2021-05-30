import 'package:flutter_modular/flutter_modular.dart';

import '../shared/http_client/client_interface.dart';
import '../shared/http_client/custom_dio/dio_client.dart';
import 'app_controller.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // global controller the app
    Bind.singleton((i) => AppController()),
    // dio client http instance
    Bind.lazySingleton<IClientHttp>((i) => DioClient()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}

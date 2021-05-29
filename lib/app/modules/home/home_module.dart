import 'package:allocation_front/app/modules/home/ui/pages/home/stores/get_allocations_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_allocations.dart';
import 'domain/usecases/get_day_offs.dart';
import 'external/home_datasource_impl.dart';
import 'infra/repositories/home_repository_impl.dart';
import 'ui/pages/home/controllers/home_controller.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/home/stores/insert_allocation_store.dart';
import 'ui/pages/home/stores/insert_day_off_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // all controllers
    Bind.lazySingleton((i) => HomeController(i(), i(), i())),
    // all usecases
    Bind.factory((i) => GetAllocations(i())),
    Bind.factory((i) => GetDayOffs(i())),
    // all stores
    Bind.factory((i) => GetAllocationsStore(i())),
    Bind.factory((i) => InsertDayOffStore()),
    Bind.factory((i) => InsertAllocationStore()),
    // repository layer
    Bind.factory((i) => HomeRepositoryImpl(i())),
    // datasource layer
    Bind.factory((i) => HomeDatasourceImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}

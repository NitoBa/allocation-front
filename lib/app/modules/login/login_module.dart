import 'package:flutter_modular/flutter_modular.dart';

import 'ui/pages/signin/controllers/sign_in_controller.dart';
import 'ui/pages/signin/sign_in_page.dart';
import 'ui/pages/signup/controllers/sing_up_controller.dart';
import 'ui/pages/signup/sign_up_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SignInController()),
    Bind.singleton((i) => SignUpController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/signin', child: (_, args) => SignInPage()),
    ChildRoute('/signup', child: (_, args) => SignUpPage()),
  ];
}

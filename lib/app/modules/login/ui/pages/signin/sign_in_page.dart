import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignInPage, SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn'),
      ),
    );
  }
}

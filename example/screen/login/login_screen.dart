import 'package:fgen/viewmodel/login/login_viewmodel.dart';
import 'package:fgen/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Container(),
    );
  }
}

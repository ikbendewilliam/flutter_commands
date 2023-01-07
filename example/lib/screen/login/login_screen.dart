import 'package:fgen/viewmodel/login/login_viewmodel.dart';
import 'package:fgen/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_x_navigation_generator_interface/get_x_navigation_generator_interface.dart';

@getXRoute
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => GetIt.I()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
          Container(),
    );
  }
}

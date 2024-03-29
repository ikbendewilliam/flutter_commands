import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:example/navigator/main_navigator.dart';
import 'package:example/repository/login/login_repository.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final LoginRepository _loginRepository;

  LoginViewModel(
    this._navigator,
    this._loginRepository,
  );

  Future<void> init() async {}
}

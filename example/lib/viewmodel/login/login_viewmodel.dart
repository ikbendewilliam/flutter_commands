import 'package:fgen/navigator/main_navigator.dart';
import 'package:fgen/repository/login/login_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final LoginRepository _loginRepository;

  LoginViewModel(this._navigator, this._loginRepository);

  Future<void> init() async {}
}

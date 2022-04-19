import 'package:fc/repository/login/login_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  late final LoginNavigator navigator;
  final LoginRepository _loginRepository;

  LoginViewModel(this._loginRepository);

  Future<void> initBase(LoginNavigator navigator) async {
    this.navigator = navigator;
  }
}

mixin LoginNavigator {
}

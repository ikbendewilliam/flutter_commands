import 'package:fgen/repository/login/login_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  late final LoginNavigator _navigator;
  final LoginRepository _loginRepository;

  LoginViewModel(this._loginRepository);

  Future<void> init(LoginNavigator navigator) async {
    _navigator = navigator;
  }
}

mixin LoginNavigator {
}

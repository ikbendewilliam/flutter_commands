import 'package:fgen/service/login/login_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(LoginService loginService) = _LoginRepository;
}

class _LoginRepository implements LoginRepository {
  final LoginService _loginService;

  _LoginRepository(this._loginService);
}

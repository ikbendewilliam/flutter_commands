import 'package:injectable/injectable.dart';
import 'package:example/webservice/login/login_service.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(LoginService loginService ) = _LoginRepository;
}

class _LoginRepository implements LoginRepository {
  final LoginService _loginService;

  _LoginRepository(this._loginService );
}

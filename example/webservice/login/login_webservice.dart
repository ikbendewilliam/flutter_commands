import 'package:fgen/webservice/login/login_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_webservice.g.dart';

@LazySingleton(as: LoginService)
@RestApi()
abstract class LoginWebService extends LoginService {
  @factoryMethod
  factory LoginWebService(Dio dio) = _LoginWebService;
}

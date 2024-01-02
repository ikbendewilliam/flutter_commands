import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:example/webservice/login/login_service.dart';

part 'login_webservice.g.dart';

@LazySingleton(as: LoginService)
@RestApi()
abstract class LoginWebService extends LoginService {
  @factoryMethod
  factory LoginWebService(Dio dio) = _LoginWebService;

  @GET('/example')
  Future<void> getExample();
}

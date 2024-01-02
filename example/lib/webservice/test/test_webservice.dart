import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:example/webservice/test/test_service.dart';

part 'test_webservice.g.dart';

@LazySingleton(as: TestService)
@RestApi()
abstract class TestWebService extends TestService {
  @factoryMethod
  factory TestWebService(Dio dio) = _TestWebService;

  @GET('/example')
  Future<void> getExample();
}

import 'package:injectable/injectable.dart';
import 'package:example/webservice/test/test_service.dart';

@lazySingleton
abstract class TestRepository {
  @factoryMethod
  factory TestRepository(
      TestService
          testService ) = _TestRepository;
}

class _TestRepository implements TestRepository {
  final TestService _testService;

  _TestRepository(
      this._testService );
}

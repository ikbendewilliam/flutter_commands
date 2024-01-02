import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:example/navigator/main_navigator.dart';
import 'package:example/repository/test/test_repository.dart';

@injectable
class TestViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final TestRepository _testRepository;

  TestViewModel(
    this._navigator,
    this._testRepository,
  );

  Future<void> init() async {}
}

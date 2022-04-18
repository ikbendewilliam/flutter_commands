import 'package:flutter_commands/code/code_generator_class.dart';

class GenerateViewmodel extends CodeGeneratorClass {
  @override
  String get folder => 'viewmodel';
  @override
  String get fileSuffix => '_viewmodel';

  @override
  String generate({
    required String name,
    String? projectName,
  }) {
    return '''import 'package:injectable/injectable.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

@injectable
class ${name}ViewModel with ChangeNotifierEx {
  late final ${name}Navigator navigator;

  ${name}ViewModel();

  Future<void> initBase(${name}Navigator navigator) async {
    this.navigator = navigator;
  }
}

mixin ${name}Navigator {
}
''';
  }
}

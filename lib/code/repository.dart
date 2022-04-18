import 'package:flutter_commands/code/code_generator_class.dart';

class GenerateRepository extends CodeGeneratorClass {
  @override
  String get folder => 'repository';
  @override
  String get fileSuffix => '_repository';

  @override
  String generate({
    required String name,
    String? projectName,
  }) {
    return '''import 'package:injectable/injectable.dart';

@lazySingleton
abstract class ${name}Repository {
  @factoryMethod
  factory ${name}Repository() = _${name}Repository;
}

class _${name}Repository implements ${name}Repository {
  _${name}Repository();
}
''';
  }
}

import 'package:fc/code/code_generator_class.dart';
import 'package:fc/code/generate_code.dart';

class GenerateRepository extends CodeGeneratorClass {
  @override
  String get folder => 'repository';

  @override
  String get fileSuffix => '_repository';

  @override
  String generate({
    required String name,
    String? projectName,
    Set<GenerateType>? allGeneratedTypes,
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

import 'package:fgen/code/code_generator_class.dart';
import 'package:fgen/code/generate_code.dart';
import 'package:fgen/util/string_extension.dart';

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
    final withService = allGeneratedTypes?.contains(GenerateType.service) == true;
    final imports = [
      '''import 'package:injectable/injectable.dart';''',
      if (projectName != null && withService) '''import 'package:$projectName/service/${name.toSnakeCase()}/${name.toSnakeCase()}_service.dart';''',
    ]..sort();
    var result = '''${imports.join('\n')}

@lazySingleton
abstract class ${name}Repository {
  @factoryMethod
  factory ${name}Repository(${withService ? '${name.toCamelCase()}Service ${name.toLowerCamelCase()}Service' : ''}) = _${name}Repository;
}

class _${name}Repository implements ${name}Repository {
''';
    if (withService) {
      result += '''
  final ${name}Service _${name.toLowerCamelCase()}Service;

''';
    }
    result += '''
  _${name}Repository(${withService ? 'this._${name.toLowerCamelCase()}Service' : ''});
}
''';
    return result;
  }
}

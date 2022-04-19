import 'package:fgen/code/code_generator_class.dart';
import 'package:fgen/code/generate_code.dart';
import 'package:fgen/util/string_extension.dart';

class GenerateViewmodel extends CodeGeneratorClass {
  @override
  String get folder => 'viewmodel';

  @override
  String get fileSuffix => '_viewmodel';

  @override
  String generate({
    required String name,
    String? projectName,
    Set<GenerateType>? allGeneratedTypes,
  }) {
    final withRepository = allGeneratedTypes?.contains(GenerateType.repository) == true;
    final imports = [
      '''import 'package:injectable/injectable.dart';''',
      '''import 'package:icapps_architecture/icapps_architecture.dart';''',
      if (projectName != null && withRepository) '''import 'package:$projectName/repository/${name.toSnakeCase()}/${name.toSnakeCase()}_repository.dart';''',
    ]..sort();
    var result = '''${imports.join('\n')}

@injectable
class ${name}ViewModel with ChangeNotifierEx {
  late final ${name}Navigator navigator;
''';
    if (withRepository) {
      result += '''
  final ${name}Repository _${name.toLowerCamelCase()}Repository;
''';
    }
    result += '''

  ${name}ViewModel(${withRepository ? 'this._${name.toLowerCamelCase()}Repository' : ''});

  Future<void> initBase(${name}Navigator navigator) async {
    this.navigator = navigator;
  }
}

mixin ${name}Navigator {
}
''';
    return result;
  }
}

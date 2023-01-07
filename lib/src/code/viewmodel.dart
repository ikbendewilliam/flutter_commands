import 'package:fgen/src/code/code_generator_class.dart';
import 'package:fgen/src/code/generate_code.dart';
import 'package:fgen/src/util/string_extension.dart';

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
    final withRepository =
        allGeneratedTypes?.contains(GenerateType.repository) == true;
    final imports = [
      "import 'package:injectable/injectable.dart';",
      "import 'package:icapps_architecture/icapps_architecture.dart';",
      "import 'package:$projectName/navigator/main_navigator.dart';",
      if (projectName != null && withRepository)
        "import 'package:$projectName/repository/${name.toSnakeCase()}/${name.toSnakeCase()}_repository.dart';",
    ]..sort();
    var result = '''${imports.join('\n')}

@injectable
class ${name}ViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
''';
    if (withRepository) {
      result += '''
  final ${name}Repository _${name.toLowerCamelCase()}Repository;
''';
    }
    result += '''

  ${name}ViewModel(this._navigator${withRepository ? ', this._${name.toLowerCamelCase()}Repository' : ''});

  Future<void> init() async {
  }
}
''';
    return result;
  }
}

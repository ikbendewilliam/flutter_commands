import 'package:fc/code/code_generator_class.dart';
import 'package:fc/code/generate_code.dart';
import 'package:fc/util/string_extension.dart';

class GenerateScreen extends CodeGeneratorClass {
  @override
  String get folder => 'screen';

  @override
  String get fileSuffix => '_screen';

  @override
  String generate({
    required String name,
    String? projectName,
    Set<GenerateType>? allGeneratedTypes,
  }) {
    final imports = [
      '''import 'package:flutter/material.dart';''',
      '''import 'package:get_it/get_it.dart';''',
      if (projectName != null) '''import 'package:$projectName/viewmodel/${name.toSnakeCase()}/${name.toSnakeCase()}_viewmodel.dart';''',
    ]..sort();
    return '''${imports.join('\n')}

class ${name}Screen extends StatefulWidget {
  static const String routeName = RouteNames.${name.toLowerCamelCase()}Screen;

  const ${name}Screen({Key? key}) : super(key: key);

  @override
  ${name}ScreenState createState() => ${name}ScreenState();
}

class ${name}ScreenState extends State<${name}Screen> implements ${name}Navigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<${name}ViewModel>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Container(),
    );
  }
}
''';
  }
}

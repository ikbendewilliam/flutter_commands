import 'package:fgen/src/code/code_generator_class.dart';
import 'package:fgen/src/code/generate_code.dart';
import 'package:fgen/src/util/string_extension.dart';

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
    final withViewModel =
        allGeneratedTypes?.contains(GenerateType.viewmodel) == true;
    final imports = [
      "import 'package:flutter/material.dart';",
      "import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';",
      if (projectName != null) ...[
        "import 'package:$projectName/widget/provider/provider_widget.dart';",
        if (withViewModel) ...[
          "import 'package:$projectName/di/injectable.dart';",
          "import 'package:$projectName/viewmodel/${name.toSnakeCase()}/${name.toSnakeCase()}_viewmodel.dart';",
        ],
      ],
    ]..sort();
    var result = '''${imports.join('\n')}

@getXRoute
class ${name}Screen extends StatefulWidget {

  const ${name}Screen({super.key});

  @override
  ${name}ScreenState createState() => ${name}ScreenState();
}

class ${name}ScreenState extends State<${name}Screen> {
  @override
  Widget build(BuildContext context) {
    return ''';
    if (withViewModel) {
      result += '''ProviderWidget<${name}ViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => ''';
    }
    result += 'Container()';
    if (withViewModel) {
      result += ''',
    )''';
    }
    result += ''';
  }
}
''';
    return result;
  }
}

import 'dart:io';

import 'package:fgen/src/code/fgen_template.dart';
import 'package:fgen/src/util/file_utils.dart';
import 'package:fgen/src/util/pubspec_utils.dart';
import 'package:fgen/src/util/string_extension.dart';
import 'package:path/path.dart' as path;

typedef TemplateVariablesMethod = String Function(
    String name, String? projectName, List<String> usedTemplates);

class CodeGenerator {
  static Future<int> generate({
    required String name,
    required String templateFile,
    required String? fileSuffix,
    required FgenTemplate template,
    required String? pubspec,
    required List<String> usedTemplates,
  }) async {
    final projectName = PubspecUtils.getProjectName(pubspec) ?? 'project_name';
    final templatesFolder = PubspecUtils.getTemplatesFolder(pubspec);
    final code = await generateCode(
      name: name,
      templateFile: templateFile,
      projectName: projectName,
      templatesFolder: templatesFolder,
      usedTemplates: usedTemplates,
      fromDefaultTemplate: template.fromDefaultTemplate,
    );

    final folder = path.joinAll([
      pubspec != null ? path.dirname(pubspec) : Directory.current.path,
      'lib',
      template.folder,
      name.toSnakeCase(),
    ]);
    final filename = path.joinAll([
      folder,
      '$name${fileSuffix ?? ''}.dart'.toSnakeCase(),
    ]);
    Directory(folder).createSync(recursive: true);
    final file = File(filename);
    file.writeAsStringSync(code);
    print('$filename generated');
    return 0;
  }

  static final regexFgenIf = RegExp(
    r'\/\*\s*fgen_if\s*(!)?\s*(templatesUsedContains)\((.*)\)\s\*\/\s?((?:.(?!fgen_if|fgen_else|fgen_endif)|\n)*)?(?:\/\*\s*fgen_else\s*\*\/\s?((?:.(?!fgen_if|fgen_endif)|\n)*)?)?\/\*\s*fgen_endif\s*\*\/\n?',
    multiLine: true,
  );

  static Future<String> generateCode({
    required String name,
    required String templateFile,
    required String projectName,
    required List<String> usedTemplates,
    required bool fromDefaultTemplate,
    String? templatesFolder,
  }) async {
    File? template;
    final fileLocation = fromDefaultTemplate
        ? await FileUtils.getTemplateFile(templateFile)
        : path.joinAll([templatesFolder ?? '', templateFile]);
    if (fileLocation != null) template = File(fileLocation);
    if (fileLocation == null || template == null || !template.existsSync()) {
      print(
          'ERROR: Template file not found: $templateFile, looked in $fileLocation');
      throw Exception('Template file not found: $templateFile');
    }

    var code = template.readAsStringSync();
    for (final variable in _variables.entries) {
      code = code.replaceAll(
          variable.key, variable.value(name, projectName, usedTemplates));
    }

    // Check for fgen_if templatesUsedContains(...)
    // Note: this is a loop, because the code can contain nested fgen_ifs and the
    // code needs to be replaced multiple times so allMatches doesn't work here.
    var match = regexFgenIf.firstMatch(code);
    while (match != null) {
      final not = match.group(1) != null;
      final operation = match.group(2);
      final templateName = match.group(3);
      final ifCode = match.group(4);
      final elseCode = (match.groupCount < 5) ? null : match.group(5);
      if (operation != 'templatesUsedContains') {
        print('ERROR: Unknown operation: $operation');
        throw Exception('Unknown operation: $operation');
      }
      final contains = usedTemplates.contains(templateName);
      final replace = not ? !contains : contains;
      code = code.replaceRange(
        match.start,
        match.end,
        replace ? ifCode ?? '' : elseCode ?? '',
      );
      match = regexFgenIf.firstMatch(code);
    }
    return code;
  }

  static final _variables = <String, TemplateVariablesMethod>{
    ...forVariable('name', (String name, _, __) => name),
    ...forVariable('project_name',
        (_, String? projectName, __) => projectName ?? 'project_name'),
  };

  static Map<String, TemplateVariablesMethod> forVariable(
          String variable, TemplateVariablesMethod converter) =>
      <String, TemplateVariablesMethod>{
        'fgen_$variable'.toCamelCase():
            (String name, String? projectName, List<String> usedTemplates) =>
                converter(name, projectName, usedTemplates).toCamelCase(),
        'fgen_$variable'.toSnakeCase():
            (String name, String? projectName, List<String> usedTemplates) =>
                converter(name, projectName, usedTemplates).toSnakeCase(),
        'fgen_$variable'.toLowerCamelCase():
            (String name, String? projectName, List<String> usedTemplates) =>
                converter(name, projectName, usedTemplates).toLowerCamelCase(),
      };
}

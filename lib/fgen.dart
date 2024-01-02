import 'dart:io';

import 'package:fgen/src/code/fgen_template.dart';
import 'package:fgen/src/code/generate_code.dart';
import 'package:fgen/src/util/pubspec_utils.dart';

/// Generate code for a given name, returns 0 if successful, -1 if not
Future<int> generateCode({
  required String name,
  required List<FgenTemplate> templatesToUse,
}) async {
  if (name.isEmpty) {
    print('Name cannot be empty');
    return -1;
  }
  if (templatesToUse.isEmpty) {
    print('No code to generate');
    return -1;
  }
  final pubspec = PubspecUtils.getPubspecFromFolder(Directory.current.path);
  var exitCode = 0;
  for (final template in templatesToUse) {
    if (template.templateFiles.isEmpty) {
      print('ERROR: No template files found for ${template.name}');
      exitCode = 2;
      continue;
    }
    for (final templateFile in template.templateFiles.entries) {
      final success = await CodeGenerator.generate(
        name: name,
        template: template,
        templateFile: templateFile.key,
        fileSuffix: templateFile.value,
        pubspec: pubspec,
        usedTemplates: templatesToUse.map((e) => e.name).toList(),
      );
      if (success != 0) {
        exitCode = success;
      }
    }
  }
  return exitCode;
}

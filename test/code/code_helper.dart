import 'dart:io';

import 'package:fgen/src/code/generate_code.dart';
import 'package:test/test.dart';

class CodeGeneratorTestHelper {
  static Future<void> testCodeGenerator(
    String templateFile,
    String name,
    String resultFileName, {
    bool overwriteOutputFiles = false,
    List<String> templatesUsed = const [],
  }) async {
    final file = File('test/code/outputs/$resultFileName.txt');
    final actual = await CodeGenerator.generateCode(
      name: name,
      templateFile: templateFile,
      projectName: 'test_project',
      usedTemplates: templatesUsed,
      fromDefaultTemplate: true,
    );
    if (overwriteOutputFiles) {
      file.writeAsStringSync(actual);
    } else {
      final output = file.readAsStringSync();
      expect(actual, output);
    }
  }
}

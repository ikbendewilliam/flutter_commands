import 'dart:io';

import 'package:flutter_commands/code/generate_code.dart';
import 'package:flutter_commands/util/string_extension.dart';
import 'package:test/test.dart';

class CodeGeneratorTestHelper {
  static testCodeGenerator(GenerateType type, String name, String resultFileName, {bool overwriteOutputFiles = false}) {
    final file = File('test/code/outputs/$resultFileName.txt');
    final actual = GenerateCode.getGenerator(type).generate(name: name.toCamelCase(), projectName: 'test_project');
    if (overwriteOutputFiles) {
      file.writeAsStringSync(actual);
    } else {
      final output = file.readAsStringSync();
      expect(actual, output);
    }
  }
}

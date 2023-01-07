import 'dart:io';

import 'package:fgen/src/code/generate_code.dart';
import 'package:fgen/src/util/string_extension.dart';
import 'package:test/test.dart';

class CodeGeneratorTestHelper {
  static void testCodeGenerator(
      GenerateType type, String name, String resultFileName,
      {bool overwriteOutputFiles = false,
      List<GenerateType> additionalTypes = const []}) {
    final file = File('test/code/outputs/$resultFileName.txt');
    final actual = GenerateCode.getGenerator(type).generate(
      name: name.toCamelCase(),
      projectName: 'test_project',
      allGeneratedTypes: additionalTypes.toSet()..add(type),
    );
    if (overwriteOutputFiles) {
      file.writeAsStringSync(actual);
    } else {
      final output = file.readAsStringSync();
      expect(actual, output);
    }
  }
}

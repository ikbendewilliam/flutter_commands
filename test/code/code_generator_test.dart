import 'package:flutter_commands/code/generate_code.dart';
import 'package:test/test.dart';

import 'code_helper.dart';

void main() {
  const overwriteOutputFiles = true; // WARNING: This will update the output files with the new generated code.

  group('Code generator', () {
    setUpAll(() {
      if (overwriteOutputFiles) {
        print('WARNING: This will update the output files with the new generated code.');
      }
    });

    tearDownAll(() {
      if (overwriteOutputFiles) {
        print('WARNING: This will update the output files with the new generated code.');
      }
    });

    test('ViewModel', () {
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.viewmodel, 'normal', 'viewmodel-normal', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.viewmodel, 'NormalWithCamelCase', 'viewmodel-camelcase', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.viewmodel, 'normal_with_snake_case', 'viewmodel-snakecase', overwriteOutputFiles: overwriteOutputFiles);
    });

    test('Screen', () {
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'normal', 'screen-normal', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'NormalWithCamelCase', 'screen-camelcase', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'normal_with_snake_case', 'screen-snakecase', overwriteOutputFiles: overwriteOutputFiles);
    });

    test('Repository', () {
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'normal', 'repository-normal', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'NormalWithCamelCase', 'repository-camelcase', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'normal_with_snake_case', 'repository-snakecase', overwriteOutputFiles: overwriteOutputFiles);
    });
  });
}

import 'package:fc/code/generate_code.dart';
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

      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.viewmodel, 'normal', 'viewmodel-with-repository-normal',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.repository]);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.viewmodel, 'NormalWithCamelCase', 'viewmodel-with-repository-camelcase',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.repository]);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.viewmodel, 'normal_with_snake_case', 'viewmodel-with-repository-snakecase',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.repository]);
    });

    test('Screen', () {
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'normal', 'screen-normal', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'NormalWithCamelCase', 'screen-camelcase', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'normal_with_snake_case', 'screen-snakecase', overwriteOutputFiles: overwriteOutputFiles);

      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'normal', 'screen-with-viewmodel-normal',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.viewmodel]);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'NormalWithCamelCase', 'screen-with-viewmodel-camelcase',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.viewmodel]);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.screen, 'normal_with_snake_case', 'screen-with-viewmodel-snakecase',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.viewmodel]);
    });

    test('Repository', () {
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'normal', 'repository-normal', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'NormalWithCamelCase', 'repository-camelcase', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'normal_with_snake_case', 'repository-snakecase', overwriteOutputFiles: overwriteOutputFiles);

      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'normal', 'repository-with-service-normal',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.service]);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'NormalWithCamelCase', 'repository-with-service-camelcase',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.service]);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.repository, 'normal_with_snake_case', 'repository-with-service-snakecase',
          overwriteOutputFiles: overwriteOutputFiles, additionalTypes: [GenerateType.service]);
    });

    test('Service', () {
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.service, 'normal', 'service-normal', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.service, 'NormalWithCamelCase', 'service-camelcase', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.service, 'normal_with_snake_case', 'service-snakecase', overwriteOutputFiles: overwriteOutputFiles);
    });

    test('WebService', () {
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.webService, 'normal', 'webService-normal', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.webService, 'NormalWithCamelCase', 'webService-camelcase', overwriteOutputFiles: overwriteOutputFiles);
      CodeGeneratorTestHelper.testCodeGenerator(GenerateType.webService, 'normal_with_snake_case', 'webService-snakecase', overwriteOutputFiles: overwriteOutputFiles);
    });
  });
}

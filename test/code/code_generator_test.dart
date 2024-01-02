import 'package:fgen/src/code/fgen_template.dart';
import 'package:fgen/src/code/process_yaml_template.dart';
import 'package:test/test.dart';

import 'code_helper.dart';

void main() {
  const overwriteOutputFiles =
      false; // WARNING: This will update the output files with the new generated code.
  final templates = <FgenTemplate>[];

  group('Code generator', () {
    setUpAll(() async {
      // ignore: dead_code
      if (overwriteOutputFiles) {
        print(
            'WARNING: This will update the output files with the new generated code.');
      }
      final templatesProcessed = ProcessYamlTemplates();
      await templatesProcessed.processTemplates();
      templates.addAll(templatesProcessed.templates);
    });

    tearDownAll(() {
      // ignore: dead_code
      if (overwriteOutputFiles) {
        print(
            'WARNING: This will update the output files with the new generated code.');
      }
    });

    test('ViewModel', () async {
      await CodeGeneratorTestHelper.testCodeGenerator(
          'viewmodel.dart', 'normal', 'viewmodel-normal',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'viewmodel.dart', 'NormalWithCamelCase', 'viewmodel-camelcase',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'viewmodel.dart', 'normal_with_snake_case', 'viewmodel-snakecase',
          overwriteOutputFiles: overwriteOutputFiles);

      await CodeGeneratorTestHelper.testCodeGenerator(
          'viewmodel.dart', 'normal', 'viewmodel-with-repository-normal',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['repository']);
      await CodeGeneratorTestHelper.testCodeGenerator('viewmodel.dart',
          'NormalWithCamelCase', 'viewmodel-with-repository-camelcase',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['repository']);
      await CodeGeneratorTestHelper.testCodeGenerator('viewmodel.dart',
          'normal_with_snake_case', 'viewmodel-with-repository-snakecase',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['repository']);
    });

    test('Screen', () async {
      await CodeGeneratorTestHelper.testCodeGenerator(
          'screen.dart', 'normal', 'screen-normal',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'screen.dart', 'NormalWithCamelCase', 'screen-camelcase',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'screen.dart', 'normal_with_snake_case', 'screen-snakecase',
          overwriteOutputFiles: overwriteOutputFiles);

      await CodeGeneratorTestHelper.testCodeGenerator(
          'screen.dart', 'normal', 'screen-with-viewmodel-normal',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['viewmodel']);
      await CodeGeneratorTestHelper.testCodeGenerator('screen.dart',
          'NormalWithCamelCase', 'screen-with-viewmodel-camelcase',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['viewmodel']);
      await CodeGeneratorTestHelper.testCodeGenerator('screen.dart',
          'normal_with_snake_case', 'screen-with-viewmodel-snakecase',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['viewmodel']);
    });

    test('Repository', () async {
      await CodeGeneratorTestHelper.testCodeGenerator(
          'repository.dart', 'normal', 'repository-normal',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'repository.dart', 'NormalWithCamelCase', 'repository-camelcase',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'repository.dart', 'normal_with_snake_case', 'repository-snakecase',
          overwriteOutputFiles: overwriteOutputFiles);

      await CodeGeneratorTestHelper.testCodeGenerator(
          'repository.dart', 'normal', 'repository-with-service-normal',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['webservice']);
      await CodeGeneratorTestHelper.testCodeGenerator('repository.dart',
          'NormalWithCamelCase', 'repository-with-service-camelcase',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['webservice']);
      await CodeGeneratorTestHelper.testCodeGenerator('repository.dart',
          'normal_with_snake_case', 'repository-with-service-snakecase',
          overwriteOutputFiles: overwriteOutputFiles,
          templatesUsed: ['webservice']);
    });

    test('Service', () async {
      await CodeGeneratorTestHelper.testCodeGenerator(
          'service.dart', 'normal', 'service-normal',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'service.dart', 'NormalWithCamelCase', 'service-camelcase',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'service.dart', 'normal_with_snake_case', 'service-snakecase',
          overwriteOutputFiles: overwriteOutputFiles);
    });

    test('WebService', () async {
      await CodeGeneratorTestHelper.testCodeGenerator(
          'webService.dart', 'normal', 'webService-normal',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'webService.dart', 'NormalWithCamelCase', 'webService-camelcase',
          overwriteOutputFiles: overwriteOutputFiles);
      await CodeGeneratorTestHelper.testCodeGenerator(
          'webService.dart', 'normal_with_snake_case', 'webService-snakecase',
          overwriteOutputFiles: overwriteOutputFiles);
    });
  });
}

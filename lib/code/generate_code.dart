import 'dart:io';

import 'package:fc/code/code_generator_class.dart';
import 'package:fc/code/repository.dart';
import 'package:fc/code/screen.dart';
import 'package:fc/code/service.dart';
import 'package:fc/code/viewmodel.dart';
import 'package:fc/code/webservice.dart';
import 'package:fc/util/pubspec_utils.dart';
import 'package:fc/util/string_extension.dart';
import 'package:path/path.dart' as path;

enum GenerateType {
  screen,
  viewmodel,
  repository,
  service,
  webService,
}

class GenerateCode {
  static void write(
    GenerateType type,
    String name,
    String? pubspec,
    Set<GenerateType>? allGeneratedTypes,
  ) {
    final generator = getGenerator(type);
    final projectName = PubspecUtils.getProjectName(pubspec);
    final code = generator.generate(
      name: name.toCamelCase(),
      projectName: projectName,
      allGeneratedTypes: allGeneratedTypes,
    );
    final folder = path.joinAll([
      pubspec != null ? path.dirname(pubspec) : Directory.current.path,
      'lib',
      generator.folder,
      name.toSnakeCase(),
    ]);
    final filename = path.joinAll([
      folder,
      '$name${generator.fileSuffix}.dart'.toSnakeCase(),
    ]);
    Directory(folder).createSync(recursive: true);
    final file = File(filename);
    file.writeAsStringSync(code);
    print('$filename generated');
  }

  static CodeGeneratorClass getGenerator(GenerateType type) {
    switch (type) {
      case GenerateType.screen:
        return GenerateScreen();
      case GenerateType.viewmodel:
        return GenerateViewmodel();
      case GenerateType.repository:
        return GenerateRepository();
      case GenerateType.service:
        return GenerateService();
      case GenerateType.webService:
        return GenerateWebService();
      default:
        throw Exception('Unknown type: $type');
    }
  }
}

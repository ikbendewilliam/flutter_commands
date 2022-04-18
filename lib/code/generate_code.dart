import 'dart:io';

import 'package:flutter_commands/code/code_generator_class.dart';
import 'package:flutter_commands/code/repository.dart';
import 'package:flutter_commands/code/screen.dart';
import 'package:flutter_commands/code/viewmodel.dart';
import 'package:flutter_commands/util/string_extension.dart';
import 'package:path/path.dart' as path;

enum GenerateType {
  screen,
  viewmodel,
  repository,
}

class GenerateCode {
  static void write(GenerateType type, String name) {
    final generator = getGenerator(type);
    final code = generator.generate(name: name.toCamelCase());
    final filename = path.joinAll([
      generator.folder,
      name.toSnakeCase(),
      '$name${generator.fileSuffix}'.toSnakeCase(),
    ]);
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
      default:
        throw Exception('Unknown type: $type');
    }
  }
}

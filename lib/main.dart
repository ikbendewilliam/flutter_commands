import 'dart:io';

import 'package:fgen/src/code/generate_code.dart';
import 'package:fgen/src/util/pubspec_utils.dart';

/// Generate code for a given name, returns 0 if successful, -1 if not
int generateCode({
  required String name,
  required Set<GenerateType> types,
}) {
  if (name.isEmpty) {
    print('Name cannot be empty');
    return -1;
  }
  if (types.isEmpty) {
    print('No code to generate');
    return -1;
  }
  final pubspec = PubspecUtils.getPubspecFromFolder(Directory.current.path);
  for (final type in types) {
    GenerateCode.write(type, name, pubspec, types);
  }
  return 0;
}

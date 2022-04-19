import 'dart:io';

import 'package:fgen/code/generate_code.dart';
import 'package:fgen/code/navigator.dart';
import 'package:fgen/util/pubspec_utils.dart';
import 'package:path/path.dart';

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
  final projectName = PubspecUtils.getProjectName(pubspec);
  for (final type in types) {
    GenerateCode.write(type, name, pubspec, types);
    if (type == GenerateType.screen && pubspec != null && projectName != null) {
      final path = dirname(pubspec);
      UpdateNavigation.writeNavigation(
        name: name,
        projectName: projectName,
        path: path,
      );
      UpdateNavigation.writeNavigator(
        name: name,
        projectName: projectName,
        path: path,
      );
    }
  }
  return 0;
}

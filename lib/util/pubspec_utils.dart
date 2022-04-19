import 'dart:io';

import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

class PubspecUtils {
  static String? getPubspecFromFolder(String path) {
    final pubspec = joinAll([
      path,
      'pubspec.yaml',
    ]);
    if (File(pubspec).existsSync()) return pubspec;
    final folder = dirname(path);
    if (folder.isEmpty || folder == '/' || folder == '.') return null;
    return getPubspecFromFolder(folder);
  }

  static String? getProjectName(String? pubspec) {
    if (pubspec == null) return null;
    final file = File(pubspec);
    if (!file.existsSync()) return null;
    final content = file.readAsStringSync();
    final yaml = loadYaml(content);
    return yaml['name'] as String?;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:fgen/util/string_extension.dart';
import 'package:path/path.dart';

class UpdateNavigation {
  static void writeNavigation({
    required String name,
    required String projectName,
    required String path,
  }) {
    final mainNavigationFile = File(join(path, 'lib', 'navigator', 'main_navigation.dart'));
    if (!mainNavigationFile.existsSync()) {
      print('`${mainNavigationFile.path}` does not exists. Can not add navigation logic.');
      return;
    }
    final sb = StringBuffer();
    final content = mainNavigationFile.readAsStringSync();
    final lines = const LineSplitter().convert(content);
    for (final line in lines) {
      sb.writeln(line);
      if (line == '  void goBack<T>({T? result});') {
        sb
          ..writeln()
          ..writeln('  void goTo${name.toCamelCase()}();');
      }
    }
    mainNavigationFile.writeAsStringSync(sb.toString());
    print('Added navigation logic to `${mainNavigationFile.path}`.');
  }

  static void writeNavigator({
    required String name,
    required String projectName,
    required String path,
  }) {
    final mainNavigatorFile = File(join(path, 'lib', 'navigator', 'main_navigator.dart'));
    if (!mainNavigatorFile.existsSync()) {
      print('`${mainNavigatorFile.path}` does not exists. Can not add navigator logic.');
      return;
    }
    final sb = StringBuffer();
    final content = mainNavigatorFile.readAsStringSync();
    final lines = const LineSplitter().convert(content);
    var imported = false;
    final import = '''import 'package:$projectName/screen/${name.toSnakeCase()}/${name.toSnakeCase()}_screen.dart';''';
    for (final line in lines) {
      if (line.compareTo(import) > 0 && !imported) {
        sb.writeln(import);
        imported = true;
      }
      sb.writeln(line);
      if (line == '  void goBack<T>({T? result}) => _navigator.pop(result);') {
        sb
          ..writeln()
          ..writeln('  @override')
          ..writeln('  void goTo$name() => _navigator.pushReplacementNamed(${name}Screen.routeName);');
      } else if (line == '        return MaterialPageRoute<void>(builder: (context) => FlavorBanner(child: Container(color: Colors.grey)), settings: settings);') {
        sb
          ..writeln('      case ${name}Screen.routeName:')
          ..writeln('        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: ${name}Screen()), settings: settings);');
      }
    }
    mainNavigatorFile.writeAsStringSync(sb.toString());
    print('Added navigator logic to `${mainNavigatorFile.path}`.');
  }
}

import 'dart:io';

class FlutterHelper {
  FlutterHelper._();

  static Future<void> regenerateDI() async {
    final result = Process.runSync('fvm', [
      'flutter',
      'packages',
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs'
    ]);
    if (result.exitCode == 0) {
      print('Succesfully regenerated the GetIt tree');
      print('');
    } else {
      print(
          'Failed to run `fvm flutter packages pub run build_runner build --delete-conflicting-outputs`');
    }
  }
}

import 'dart:isolate';

class FileUtils {
  static Future<String?> getTemplateFile(String file) async {
    final packageUri = Uri.parse('package:fgen/src/templates/$file');
    return (await Isolate.resolvePackageUri(packageUri))?.path;
  }
}

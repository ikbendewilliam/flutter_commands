import 'package:fc/code/generate_code.dart';

abstract class CodeGeneratorClass {
  String get folder;
  String get fileSuffix;

  String generate({
    required String name,
    String? projectName,
    Set<GenerateType>? allGeneratedTypes,
  });
}

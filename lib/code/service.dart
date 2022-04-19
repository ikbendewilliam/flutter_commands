import 'package:fc/code/code_generator_class.dart';
import 'package:fc/code/generate_code.dart';

class GenerateService extends CodeGeneratorClass {
  @override
  String get folder => 'webservice';

  @override
  String get fileSuffix => '_service';

  @override
  String generate({
    required String name,
    String? projectName,
    Set<GenerateType>? allGeneratedTypes,
  }) {
    return '''abstract class ${name}Service {}
''';
  }
}

import 'package:fc/code/code_generator_class.dart';
import 'package:fc/code/generate_code.dart';
import 'package:fc/util/string_extension.dart';

class GenerateWebService extends CodeGeneratorClass {
  @override
  String get folder => 'webservice';

  @override
  String get fileSuffix => '_webservice';

  @override
  String generate({
    required String name,
    String? projectName,
    Set<GenerateType>? allGeneratedTypes,
  }) {
    return '''import 'package:$projectName/webservice/${name.toSnakeCase()}/${name.toSnakeCase()}_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part '${name.toSnakeCase()}_webservice.g.dart';

@LazySingleton(as: ${name}Service)
@RestApi()
abstract class ${name}WebService extends ${name}Service {
  @factoryMethod
  factory ${name}WebService(Dio dio) = _${name}WebService;
}
''';
  }
}

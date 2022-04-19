import 'package:fgen/code/code_generator_class.dart';
import 'package:fgen/code/generate_code.dart';
import 'package:fgen/util/string_extension.dart';

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
    final imports = [
      '''import 'package:dio/dio.dart';''',
      '''import 'package:retrofit/retrofit.dart';''',
      '''import 'package:injectable/injectable.dart';''',
      if (projectName != null) '''import 'package:$projectName/webservice/${name.toSnakeCase()}/${name.toSnakeCase()}_service.dart';''',
    ]..sort();
    return '''${imports.join('\n')}

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

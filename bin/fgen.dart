import 'dart:io';

import 'package:args/args.dart';
import 'package:fgen/code/generate_code.dart';
import 'package:fgen/main.dart';

const help = 'help';
const viewmodel = 'viewmodel';
const screen = 'screen';
const repository = 'repository';
const service = 'service';

void main(List<String> arguments) {
  exitCode = 0; // presume success
  final parser = ArgParser()
    ..addFlag(help, negatable: false, abbr: 'h', help: 'Print this help')
    ..addFlag(viewmodel, negatable: false, abbr: 'v', help: 'Generate viewmodel')
    ..addFlag(screen, negatable: false, abbr: 's', help: 'Generate screen, if viewmodel is generated, will add ProviderWidget')
    ..addFlag(repository, negatable: false, abbr: 'r', help: 'Generate repository')
    ..addFlag(service, negatable: false, abbr: 'w', help: 'Generate service and webservice');

  final argResults = parser.parse(arguments);
  if (argResults.wasParsed(help)) {
    print(parser.usage);
    return;
  }

  final String name;
  try {
    name = argResults.rest.first;
  } catch (_) {
    print('ERROR: You must provide a name');
    exitCode = 2;
    return;
  }
  final allTypes = {
    viewmodel: [GenerateType.viewmodel],
    screen: [GenerateType.screen],
    repository: [GenerateType.repository],
    service: [GenerateType.service, GenerateType.webService],
  };
  final types = allTypes.entries.where((element) => argResults.wasParsed(element.key)).expand((element) => element.value).toSet();
  exitCode = generateCode(name: name, types: types);
}

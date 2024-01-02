import 'dart:io';

import 'package:args/args.dart';
import 'package:fgen/fgen.dart';
import 'package:fgen/src/code/process_yaml_template.dart';

const help = 'help';

/// Generate code for a given name
Future<void> main(List<String> arguments) async {
  exitCode = 0; // presume success

  final templatesProcessed = ProcessYamlTemplates();
  await templatesProcessed.processTemplates();
  final templates = templatesProcessed.templates;

  final parser = ArgParser()
    ..addFlag(help, negatable: false, abbr: 'h', help: 'Print this help');
  for (final template in templates) {
    parser.addFlag(template.name,
        negatable: false, abbr: template.abbr, help: template.help);
  }

  final argResults = parser.parse(arguments);
  if (argResults.wasParsed(help)) {
    print('Found templates: ${templates.length}');
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
  final templatesToUse = templates
      .where((template) => argResults.wasParsed(template.name))
      .toList();
  exitCode = await generateCode(name: name, templatesToUse: templatesToUse);
}

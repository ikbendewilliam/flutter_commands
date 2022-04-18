import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_commands/main.dart';

const lineNumber = 'line-number';

void main(List<String> arguments) {
  exitCode = 0; // presume success
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n');

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  dcat(paths, showLineNumbers: argResults[lineNumber] as bool);
}

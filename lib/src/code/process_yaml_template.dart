import 'dart:io';

import 'package:fgen/src/code/fgen_template.dart';
import 'package:fgen/src/util/file_utils.dart';
import 'package:fgen/src/util/pubspec_utils.dart';
import 'package:yaml/yaml.dart';

class ProcessYamlTemplates {
  final _templates = <FgenTemplate>[];

  List<FgenTemplate> get templates => _templates;

  void _processTemplate({
    required String name,
    required Map<String, dynamic> doc,
    required bool fromDefaultTemplate,
  }) {
    final templateFiles = <String, String?>{};
    doc['template_files']?.forEach((templateFile) {
      if (templateFile != null) {
        if (templateFile is String) {
          templateFiles[templateFile] = null;
          return;
        }
        templateFile.forEach((key, value) {
          templateFiles[key as String] = value as String?;
        });
      }
    });
    _templates.add(
      FgenTemplate(
        templateFiles: templateFiles,
        name: name,
        folder: doc['folder'] as String,
        abbr: doc['abbr'] as String?,
        help: doc['help'] as String?,
        fromDefaultTemplate: fromDefaultTemplate,
      ),
    );
  }

  Future<void> processTemplates() async {
    await _processDefaultTemplates();
    await _processCustomTemplates();

    final templates = _templates.reversed.toSet().toList();
    _templates
      ..clear()
      ..addAll(templates)
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  Future<void> _processDefaultTemplates() async {
    final defaultTemplateFile =
        await FileUtils.getTemplateFile('default_templates.yaml');
    if (defaultTemplateFile == null) return;
    final content = File(defaultTemplateFile).readAsStringSync();
    final doc = loadYaml(content);
    doc.forEach((key, value) {
      _processTemplate(
        name: key as String,
        doc: (value as YamlMap).cast<String, dynamic>(),
        fromDefaultTemplate: true,
      );
    });
  }

  Future<void> _processCustomTemplates() async {
    final pubspec = PubspecUtils.getPubspecFromFolder(Directory.current.path);
    if (pubspec == null) return;
    final templateFolder = PubspecUtils.getTemplatesFolder(pubspec);
    if (templateFolder == null) return;
    final templateFile = File(pubspec.substring(0, pubspec.lastIndexOf('/')) +
        '/$templateFolder/templates.yaml');
    if (templateFile.existsSync() == false) return;
    final content = templateFile.readAsStringSync();
    final doc = loadYaml(content);
    doc.forEach((key, value) {
      _processTemplate(
        name: key as String,
        doc: (value as YamlMap).cast<String, dynamic>(),
        fromDefaultTemplate: false,
      );
    });
    _templates.sort((a, b) => a.name.compareTo(b.name));
  }
}

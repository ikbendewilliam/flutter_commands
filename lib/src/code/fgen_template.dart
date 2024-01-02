class FgenTemplate {
  final Map<String, String?> templateFiles;
  final String name;
  final String folder;
  final String? abbr;
  final String? help;
  final bool fromDefaultTemplate;

  FgenTemplate({
    required this.templateFiles,
    required this.name,
    required this.folder,
    required this.fromDefaultTemplate,
    this.abbr,
    this.help,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FgenTemplate && other.name == name;
  }

  @override
  int get hashCode {
    return name.hashCode;
  }
}

extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  String toCamelCase() =>
      split('_').map((e) => e.isEmpty ? '' : e.capitalize()).join('');

  String toLowerCamelCase() {
    final camelCase = toCamelCase();
    return camelCase[0].toLowerCase() + camelCase.substring(1);
  }

  String toSnakeCase() => splitMapJoin(RegExp('[A-Z]'),
      onMatch: (m) => '${m.start == 0 ? '' : '_'}${m[0]?.toLowerCase()}',
      onNonMatch: (m) => m);
}

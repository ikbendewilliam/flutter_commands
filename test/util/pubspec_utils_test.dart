import 'dart:io';

import 'package:fc/util/pubspec_utils.dart';
import 'package:test/test.dart';

void main() {
  test('find pubspec', () {
    expect(PubspecUtils.getPubspecFromFolder(Directory.current.path)?.endsWith('pubspec.yaml'), true);
    expect(PubspecUtils.getPubspecFromFolder('/test_ackjkhvbafhlglkasdfkhslakdf'), null);
    expect(PubspecUtils.getPubspecFromFolder('${Directory.current.path}/sub/directory/testing')?.endsWith('pubspec.yaml'), true);
  });

  test('get project name', () {
    expect(PubspecUtils.getProjectName(PubspecUtils.getPubspecFromFolder(Directory.current.path)), 'fc');
    expect(PubspecUtils.getProjectName(PubspecUtils.getPubspecFromFolder('/test_ackjkhvbafhlglkasdfkhslakdf')), null);
    expect(PubspecUtils.getProjectName(PubspecUtils.getPubspecFromFolder('${Directory.current.path}/sub/directory/testing')), 'fc');
  });
}

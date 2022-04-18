import 'package:flutter_commands/util/string_extension.dart';
import 'package:test/test.dart';

void main() {
  test('test normal conversion', () {
    expect('test'.toCamelCase(), 'Test');
    expect('test_test'.toCamelCase(), 'TestTest');
    expect('test_test_test'.toCamelCase(), 'TestTestTest');
    expect('TestTest'.toCamelCase(), 'TestTest');
    expect('TestTestTest'.toCamelCase(), 'TestTestTest');
    expect('testTest'.toCamelCase(), 'TestTest');
    expect('testTestTest'.toCamelCase(), 'TestTestTest');

    expect('test'.toSnakeCase(), 'test');
    expect('test_test'.toSnakeCase(), 'test_test');
    expect('test_test_test'.toSnakeCase(), 'test_test_test');
    expect('TestTest'.toSnakeCase(), 'test_test');
    expect('TestTestTest'.toSnakeCase(), 'test_test_test');
    expect('testTest'.toSnakeCase(), 'test_test');
    expect('testTestTest'.toSnakeCase(), 'test_test_test');

    expect('test'.toLowerCamelCase(), 'test');
    expect('test_test'.toLowerCamelCase(), 'testTest');
    expect('test_test_test'.toLowerCamelCase(), 'testTestTest');
    expect('TestTest'.toLowerCamelCase(), 'testTest');
    expect('TestTestTest'.toLowerCamelCase(), 'testTestTest');
    expect('testTest'.toLowerCamelCase(), 'testTest');
    expect('testTestTest'.toLowerCamelCase(), 'testTestTest');
  });

  test('test starting with lowercase doesnt cause issues', () {
    expect('_test'.toCamelCase(), 'Test');
    expect('_test_test'.toCamelCase(), 'TestTest');
    expect('_test_test'.toSnakeCase(), '_test_test');
    expect('_test_test_test'.toCamelCase(), 'TestTestTest');
    expect('_test_test_test'.toSnakeCase(), '_test_test_test');
  });
}

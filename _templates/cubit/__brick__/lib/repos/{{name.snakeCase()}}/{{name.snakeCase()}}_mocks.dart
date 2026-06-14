// ignore_for_file: unused_element
part of '{{name.snakeCase()}}_repo.dart';

class _{{name.pascalCase()}}Mocks {
  static Future<Map<String, dynamic>> {{methodName.camelCase()}}() {
    return Future.value({ 'status': 200, 'message': 'mock', 'data': {}});
  }

  // [NEW_MOCK_METHOD]
}
part of '{{name.snakeCase()}}_repo.dart';

class _{{name.pascalCase()}}Provider {
  static Future<{{model.pascalCase()}}> {{methodName.camelCase()}}() async {
    try {
      // ignore: unused_local_variable
      final raw = <String, dynamic>{};
      // Logic for API call would go here
      return {{model.pascalCase()}}.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  // [NEW_PROVIDER_METHOD]
}
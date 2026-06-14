import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('--- Route Injection Started ---');

  final rawName = context.vars['name'].toString();
  final namePath = rawName.snakeCase;
  final routeName = rawName.camelCase;
  final className = '${rawName.pascalCase}Screen';

  var destination = context.vars['destination']?.toString().trim() ?? '';
  if (destination.isEmpty) {
    destination = 'lib/ui/screens';
  }
  if (destination.endsWith('/')) {
    destination = destination.substring(0, destination.length - 1);
  }

  // The template initially places the brick at lib/ui/screens/{{name.snakeCase()}}
  final defaultSourcePath = 'lib/ui/screens/$namePath';
  final targetFullPath = '$destination/$namePath';

  if (defaultSourcePath != targetFullPath) {
    final sourceDir = Directory(defaultSourcePath);
    final targetDir = Directory(targetFullPath);

    if (sourceDir.existsSync()) {
      context.logger.info('Moving from $defaultSourcePath to $targetFullPath');
      if (!targetDir.parent.existsSync()) {
        targetDir.parent.createSync(recursive: true);
      }
      try {
        sourceDir.renameSync(targetFullPath);
      } catch (_) {
        targetDir.createSync(recursive: true);
        final entities = sourceDir.listSync(recursive: true);
        for (final entity in entities) {
          if (entity is File) {
            final relativePath = entity.path.replaceFirst(sourceDir.path, '');
            final newFile = File('${targetDir.path}$relativePath');
            newFile.parent.createSync(recursive: true);
            entity.copySync(newFile.path);
          }
        }
        sourceDir.deleteSync(recursive: true);
      }
    }
  }

  final packageImportPath = targetFullPath.replaceFirst('lib/', '');
  final sourceRoutesPath = 'lib/router/routes.dart';
  final sourceRouterPath = 'lib/router/router.dart';

  _injectDirectly(
    path: sourceRoutesPath,
    transform: (content) => _injectRoutesLogic(content, routeName, namePath),
    context: context,
  );

  _injectDirectly(
    path: sourceRouterPath,
    transform: (content) => _injectRouterLogic(
      content,
      routeName,
      className,
      namePath,
      packageImportPath,
    ),
    context: context,
  );

  context.logger.info('--- Route Injection Finished ---');
}

void _injectDirectly({
  required String path,
  required String Function(String) transform,
  required HookContext context,
}) {
  final file = File(path);

  if (!file.existsSync()) {
    context.logger.err('❌ File not found: $path');
    return;
  }

  final originalContent = file.readAsStringSync();
  final updatedContent = transform(originalContent);

  if (originalContent == updatedContent) return;

  file.writeAsStringSync(updatedContent, mode: FileMode.write, flush: true);
  context.logger.info('🚀 Directly injected route into: $path');
}

String _injectRoutesLogic(String content, String routeName, String namePath) {
  if (content.contains('static const $routeName =')) return content;

  final snippet =
      "  static const $routeName = '/$namePath';\n\n  // add route here";

  if (content.contains('// add route here')) {
    return content.replaceFirst('// add route here', snippet);
  }
  return content;
}

String _injectRouterLogic(
  String content,
  String routeName,
  String className,
  String namePath,
  String packageImportPath,
) {
  if (content.contains('AppRoutes.$routeName:')) return content;

  final snippet =
      "  AppRoutes.$routeName: (context) => const $className(),\n  // Add Route here";

  var newContent = content;
  if (newContent.contains('// Add Route here')) {
    newContent = newContent.replaceFirst('// Add Route here', snippet);
  }

  final importStatement =
      "import 'package:world_time/$packageImportPath/$namePath.dart';";
  if (!newContent.contains(importStatement)) {
    final lastImportMatch = newContent.lastIndexOf('import ');
    if (lastImportMatch != -1) {
      final endOfLastImport = newContent.indexOf(';', lastImportMatch);
      if (endOfLastImport != -1) {
        newContent =
            newContent.substring(0, endOfLastImport + 1) +
            '\n' +
            importStatement +
            newContent.substring(endOfLastImport + 1);
      }
    } else {
      newContent = importStatement + '\n' + newContent;
    }
  }

  return newContent;
}

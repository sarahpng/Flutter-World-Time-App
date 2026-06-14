import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class {{name.pascalCase()}}Provider extends ChangeNotifier {
  static {{name.pascalCase()}}Provider s(BuildContext context, [bool listen = false] ) => 
  Provider.of<{{name.pascalCase()}}Provider>(context, listen: listen);
}
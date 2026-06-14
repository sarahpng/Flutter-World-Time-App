import 'dart:async';

import 'package:world_time/configs/configs.dart';
// [IMPORT_MARKER]
import 'package:world_time/models/{{name.snakeCase()}}/{{model.snakeCase()}}.dart';
import 'package:world_time/repos/{{name.snakeCase()}}/{{name.snakeCase()}}_repo.dart';
import 'package:world_time/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart'; 

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  static {{name.pascalCase()}}Cubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<{{name.pascalCase()}}Cubit>(context, listen: listen);

  {{name.pascalCase()}}Cubit() : super({{name.pascalCase()}}State.def());

  Future<void> {{methodName.camelCase()}}() async {
    emit(
      state.copyWith(
        {{methodName.camelCase()}}: state.{{methodName.camelCase()}}.toLoading(),
      ),
    );
    try {
      final data = await {{name.pascalCase()}}Repo.ins.{{methodName.camelCase()}}();
      emit(
        state.copyWith(
          {{methodName.camelCase()}}: state.{{methodName.camelCase()}}.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          {{methodName.camelCase()}}: state.{{methodName.camelCase()}}.toFailed(fault: e),
        ),
      );
    }
  }

  // [NEW_METHOD]

  void reset() => emit({{name.pascalCase()}}State.def());
}
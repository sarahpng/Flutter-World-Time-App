part of 'cubit.dart';

@immutable
class {{name.pascalCase()}}State extends Equatable {
  // -- nested states -- //
  final BlocState<{{model.pascalCase()}}> {{methodName.camelCase()}};
  // [STATE_FIELDS]

  // --- state data --- //
  const {{name.pascalCase()}}State({
    required this.{{methodName.camelCase()}},
    // [STATE_CONSTRUCTOR]
  });

  {{name.pascalCase()}}State.def()
  : // root-def_constructor
  // [STATE_DEF];
  {{methodName.camelCase()}} = BlocState();

  {{name.pascalCase()}}State copyWith({
    BlocState<{{model.pascalCase()}}>? {{methodName.camelCase()}},
    // [STATE_COPYWITH_PARAMS]
  }) {
    return {{name.pascalCase()}}State(
      {{methodName.camelCase()}}: {{methodName.camelCase()}} ?? this.{{methodName.camelCase()}},
      // [STATE_COPYWITH_BODY]
    );
  }

  @override
  List<Object?> get props => [
    {{methodName.camelCase()}},
    // [STATE_PROPS]
  ];
}
part of 'button.dart';

class _AppButtonModel {
  final Map<AppButtonState, Color> text;
  final Map<AppButtonState, Color>? border;
  final Map<AppButtonState, Color> surface;
  final Map<AppButtonState, Gradient>? gradient;
  final Map<AppButtonState, List<BoxShadow>> shadow;

  _AppButtonModel({
    required this.text,
    required this.surface,
    this.gradient,
    // ignore: unused_element_parameter
    this.shadow = const {},
    this.border,
  });
}

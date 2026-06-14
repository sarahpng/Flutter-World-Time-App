part of '../configs.dart';

extension SuperAppText on TextStyle {
  TextStyle get sfPro => copyWith(fontFamily: FontFamily.manrope);

  /// get custom font size
  TextStyle fs(double size) => copyWith(fontSize: size);

  /// custom color
  TextStyle cl(Color color) => copyWith(color: color);

  /// remove height
  TextStyle removeHeight() {
    return merge(const TextStyle(height: 0));
  }

  /// get specific font weight
  /// FontWeight Extension
  ///
  /// .w(1) -> Thin
  ///
  /// .w(2) -> Extra Light
  ///
  /// .w(3) -> Light
  ///
  /// .w(4) -> Regular
  ///
  /// .w(5) -> Medium
  ///
  /// .w(6) -> Semi Bold
  ///
  /// .w(7) -> Bold
  ///
  /// .w(8) -> Extra Bold
  ///
  /// .w(9) -> Black
  TextStyle w(int weight) {
    final fontWeight = switch (weight) {
      1 => FontWeight.w100,
      2 => FontWeight.w200,
      3 => FontWeight.w300,
      4 => FontWeight.w400,
      5 => FontWeight.w500,
      6 => FontWeight.w600,
      7 => FontWeight.w700,
      8 => FontWeight.w800,
      9 => FontWeight.w900,
      _ => FontWeight.normal,
    };
    return copyWith(fontWeight: fontWeight);
  }
}

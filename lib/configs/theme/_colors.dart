part of '../configs.dart';

sealed class AppColors {
  // Base colors
  static const primary = Color(0xffFF9F1C);
  static const secondary = Color(0xffD84A05);
  static const tertiary = Color(0xff5E366E);

  static const white = Color(0xff1A1614);
  static const black = Color(0xff020817);

  // Gradients
  static const gradientPrimary = LinearGradient(
    colors: [primary, primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

sealed class AppColorsLight {
  // Base colors
  static const primary = Color(0xffFF9F1C);
  static const primary300 = Color(0xffFFDCBC);
  static const secondary = Color(0xffD84A05);
  static const tertiary = Color(0xff5E366E);

  // Text colors
  static const text = Color(0xffFFFFFF);
  static const subText = Color(0xffFFEEE0);
  static const background = Color(0xff161311);
  static const cardbg = Color(0xff110d0c);

  // Success colors
  static const successBase = Color(0xff2ed6a4);
  static const successShade = Color(0xff00b188);
  static const successTint = Color(0xff80e1be);

  // Warning colors
  static const warningBase = Color(0xffffa109);
  static const warningShade = Color(0xffff9008);
  static const warningTint = Color(0xffffd551);

  // Danger colors
  static const dangerBase = Color(0xffef4343);
  static const dangerShade = Color(0xffa30736);
  static const dangerTint = Color(0xffe13b5c);
}

sealed class AppColorsDark {
  // Base colors
  static const primary = Color(0xffFF9F1C);
  static const primary300 = Color(0xffFFDCBC);
  static const secondary = Color(0xffD84A05);
  static const tertiary = Color(0xff5E366E);

  // Text colors
  static const text = Color(0xffFFFFFF);
  static const subText = Color(0xffFFEEE0);
  static const background = Color(0xff161311);
  static const cardbg = Color(0xff110d0c);

  // Success colors
  static const successBase = Color(0xff2ed6a4);
  static const successShade = Color(0xff00b188);
  static const successTint = Color(0xff80e1be);

  // Warning colors
  static const warningBase = Color(0xffffa109);
  static const warningShade = Color(0xffff9008);
  static const warningTint = Color(0xffffd551);

  // Danger colors
  static const dangerBase = Color(0xffef4343);
  static const dangerShade = Color(0xffa30736);
  static const dangerTint = Color(0xffe13b5c);
}

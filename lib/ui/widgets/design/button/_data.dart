part of 'button.dart';

Map<AppButtonSize, TextStyle> _mapSizeToFontSize() {
  return {
    AppButtonSize.large: AppText.h3.removeHeight(),
    AppButtonSize.medium: AppText.b1.removeHeight(),
    AppButtonSize.small: AppText.b2.removeHeight(),
  };
}

Map<AppButtonStyle, _AppButtonModel> _mapButtonPropsToData() {
  return {
    .primary: _AppButtonModel(
      text: {AppButtonState.def: AppColors.white},
      surface: {
        AppButtonState.def: AppTheme.c.primary,
        AppButtonState.pressed: AppTheme.c.primary.withValues(alpha: 0.8),
        AppButtonState.disabled: AppTheme.c.primary.withValues(alpha: 0.5),
      },
    ),
    .primaryBorder: _AppButtonModel(
      text: {
        AppButtonState.def: AppTheme.c.primary,
        AppButtonState.pressed: AppTheme.c.primary.withValues(alpha: 0.8),
        AppButtonState.disabled: AppTheme.c.primary.withValues(alpha: 0.5),
      },
      surface: {AppButtonState.def: Colors.transparent},
      border: {
        AppButtonState.def: AppTheme.c.primary,
        AppButtonState.pressed: AppTheme.c.primary.withValues(alpha: 0.8),
        AppButtonState.disabled: AppTheme.c.primary.withValues(alpha: 0.5),
      },
    ),
    .transparent: _AppButtonModel(
      surface: {
        .def: Colors.transparent,
        .pressed: Colors.transparent,
        .disabled: Colors.transparent,
      },
      text: {
        .def: AppTheme.c.text,
        .pressed: AppTheme.c.text,
        .disabled: AppTheme.c.text.withValues(alpha: 0.5),
      },
      border: {AppButtonState.def: Colors.transparent},
    ),
    AppButtonStyle.black: _AppButtonModel(
      surface: {
        AppButtonState.def: const Color(0xFF140B12),
        AppButtonState.pressed: const Color(0xFF2D1B28),
      },
      gradient: {
        AppButtonState.def: const LinearGradient(
          colors: [Color(0xFF2D1B28), Color(0xFF140B12)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      },
      text: {AppButtonState.def: AppColors.white},
      border: {AppButtonState.def: AppTheme.c.primary},
    ),
    AppButtonStyle.blackBorder: _AppButtonModel(
      text: {
        AppButtonState.def: AppTheme.c.text,
        AppButtonState.pressed: AppTheme.c.text.withValues(alpha: 0.8),
        AppButtonState.disabled: AppTheme.c.text.withValues(alpha: 0.5),
      },
      surface: {AppButtonState.def: Colors.transparent},
      border: {
        AppButtonState.def: AppTheme.c.text,
        AppButtonState.pressed: AppTheme.c.text.withValues(alpha: 0.8),
        AppButtonState.disabled: AppTheme.c.text.withValues(alpha: 0.5),
      },
    ),
    AppButtonStyle.gradient: _AppButtonModel(
      text: {AppButtonState.def: AppColors.white},
      surface: {AppButtonState.def: AppTheme.c.primary},
      border: {AppButtonState.def: AppTheme.c.primary},
      gradient: {
        AppButtonState.def: AppTheme.c.primaryGradient,
        AppButtonState.pressed: LinearGradient(
          colors: (AppTheme.c.primaryGradient).colors
              .map((c) => c.withValues(alpha: 0.8))
              .toList(),
          begin: (AppTheme.c.primaryGradient).begin,
          end: (AppTheme.c.primaryGradient).end,
        ),
        AppButtonState.disabled: LinearGradient(
          colors: (AppTheme.c.primaryGradient).colors
              .map((c) => c.withValues(alpha: 0.5))
              .toList(),
          begin: (AppTheme.c.primaryGradient).begin,
          end: (AppTheme.c.primaryGradient).end,
        ),
      },
    ),
    AppButtonStyle.white: _AppButtonModel(
      text: {AppButtonState.def: AppColors.black},
      surface: {AppButtonState.def: AppColors.white},
      border: {AppButtonState.def: AppColors.white},
    ),
  };
}

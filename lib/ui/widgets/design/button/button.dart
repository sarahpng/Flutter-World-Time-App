import 'package:flutter/material.dart';
import 'package:world_time/configs/configs.dart';

part '_data.dart';
part '_enums.dart';
part '_model.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.onTap,
    this.label,
    this.icon,
    this.iconColor,
    this.textColor,
    this.backgroundColor,
    this.borderRadius = AppButtonRadius.normal,
    this.size = AppButtonSize.medium,
    this.style = AppButtonStyle.primary,
    this.mainAxisSize = MainAxisSize.min,
    this.state = AppButtonState.def,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isTrailing = false,
    this.height,
  });

  /// When set, the button has this fixed outer height (including padding).
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final AppButtonSize size;
  final AppButtonState state;
  final AppButtonStyle style;
  final AppButtonRadius borderRadius;
  final VoidCallback? onTap;
  final String? label;
  final Widget? icon;
  final Color? iconColor;
  final Color? textColor;

  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final bool isTrailing;
  final Color? backgroundColor;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  late AppButtonState state;

  @override
  void initState() {
    state = widget.state;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppButton oldWidget) {
    if (oldWidget.state != widget.state) {
      state = widget.state;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onTapDown(TapDownDetails? details) {
    if (_isDisabled()) return;
    setState(() => state = AppButtonState.pressed);
  }

  void _onTapUp(TapUpDetails? details) {
    if (_isDisabled()) return;
    setState(() => state = AppButtonState.def);
  }

  void _onTapCancel() {
    if (_isDisabled()) return;
    setState(() => state = AppButtonState.def);
  }

  bool _isDisabled() =>
      widget.state == AppButtonState.disabled ||
      widget.state == AppButtonState.loading;

  @override
  Widget build(BuildContext context) {
    final data =
        _mapButtonPropsToData()[widget.style] ??
        _mapButtonPropsToData()[AppButtonStyle.primary]!;

    final effectiveState = state == AppButtonState.loading
        ? AppButtonState.disabled
        : state;

    var surface =
        widget.backgroundColor ??
        data.surface[effectiveState] ??
        data.surface[AppButtonState.def]!;

    var border =
        data.border?[effectiveState] ??
        data.border?[AppButtonState.def] ??
        surface;
    var textPrimary =
        widget.textColor ??
        data.text[effectiveState] ??
        data.text[AppButtonState.def] ??
        Colors.white;

    final textStyle = _mapSizeToFontSize()[widget.size]!;
    final shadow = data.shadow[state];

    var padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
    if (widget.size == AppButtonSize.large) {
      padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 20);
    }

    final radius = widget.borderRadius == AppButtonRadius.capsule
        ? 50.radius()
        : 12.radius();

    Widget? formattedIcon;
    if (widget.icon != null) {
      final iconSize = textStyle.fontSize! * 1.2;
      formattedIcon = SizedBox(
        width: iconSize,
        height: iconSize,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            widget.iconColor ?? textPrimary,
            BlendMode.srcIn,
          ),
          child: widget.icon!,
        ),
      );
    }

    return GestureDetector(
      onTap: _isDisabled() ? null : widget.onTap,
      onTapUp: _onTapUp,
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: AppProps.medium,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding ?? padding,
        alignment: widget.height != null ? Alignment.center : null,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: radius,
          boxShadow: shadow,
          border: border == Colors.transparent
              ? null
              : Border.all(color: border.withValues(alpha: 0.2), width: 1.5),
          gradient:
              data.gradient?[effectiveState] ??
              data.gradient?[AppButtonState.def],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: widget.state == AppButtonState.loading ? 0.0 : 1.0,
              child: Row(
                mainAxisSize: widget.mainAxisSize,
                mainAxisAlignment: widget.mainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (formattedIcon != null && !widget.isTrailing) ...[
                    formattedIcon,
                    if (widget.label != null) Space.x.t12,
                  ],
                  if (widget.label != null)
                    Text(
                      widget.label!,
                      style: textStyle.copyWith(
                        color: textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (formattedIcon != null && widget.isTrailing) ...[
                    if (widget.label != null) Space.x.t12,
                    formattedIcon,
                  ],
                ],
              ),
            ),
            if (widget.state == AppButtonState.loading)
              Positioned.fill(
                child: Center(
                  child: SizedBox(
                    height: textStyle.fontSize! * 1.8,
                    width: textStyle.fontSize! * 1.8,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(textPrimary),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

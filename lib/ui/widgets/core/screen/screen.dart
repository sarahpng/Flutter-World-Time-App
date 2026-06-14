import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:world_time/configs/configs.dart';
import 'package:world_time/provider/app.dart';
import 'package:world_time/ui/widgets/headless/focus_handler.dart';

class Screen extends StatefulWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.keyboardHandler = false,
    this.renderSettings = true,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.scaffoldBackgroundColor,
    this.belowBuilders,
    this.overlayBuilders,
    this.initialFormValue,
    this.formKey,
    this.onBackPressed,
    this.canPop,
    this.appBar,
    this.endDrawer,
    this.drawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.drawerEnableOpenDragGesture = true,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool keyboardHandler;
  final bool renderSettings;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? scaffoldBackgroundColor;
  final List<Widget>? belowBuilders;
  final List<Widget>? overlayBuilders;
  final Map<String, dynamic>? initialFormValue;
  final GlobalKey<FormBuilderState>? formKey;
  final bool resizeToAvoidBottomInset;
  final void Function()? onBackPressed;
  final bool? canPop;
  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;
  final Widget? drawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool drawerEnableOpenDragGesture;

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    App.init(context);

    var body = widget.child;
    var onWillPop = widget.onBackPressed;
    var canPopValue = widget.canPop ?? true;

    if (widget.formKey != null) {
      body = FormBuilder(
        key: widget.formKey,
        initialValue: widget.initialFormValue ?? {},
        child: body,
      );
    }

    if (widget.keyboardHandler) {
      body = FocusHandler(child: body);
    }

    if (onWillPop != null || !canPopValue) {
      body = PopScope(
        canPop: canPopValue,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && onWillPop != null) {
            onWillPop();
          }
        },
        child: body,
      );
    }

    body = Padding(padding: widget.padding, child: body);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: AppProvider.s(context).themeMode == ThemeMode.dark
            ? Brightness.dark
            : Brightness.light, // for IOS
        statusBarIconBrightness:
            AppProvider.s(context).themeMode == ThemeMode.dark
            ? Brightness.light
            : Brightness.dark, // for Android
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        backgroundColor: widget.scaffoldBackgroundColor,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
        drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        endDrawer: widget.endDrawer,
        drawer: widget.drawer,
        appBar: widget.appBar,
        body: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.belowBuilders != null) ...widget.belowBuilders!,
            Positioned.fill(child: body),
            if (widget.overlayBuilders != null) ...widget.overlayBuilders!,
          ],
        ),
      ),
    );
  }
}

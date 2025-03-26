import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../gradient_widgets.dart';

class GradientAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppbar({
    Key? key,
    this.gradient = Gradients.vision,
    this.clipBehavior = Clip.none,
    this.elevation,
    this.shadowColor,
    this.semanticContainer = true,
    this.toolbarHeight = kToolbarHeight,
    this.actions,
    this.leading,
    this.title,
    this.centerTitle,
    this.systemOverlayStyle,
  })  : assert(elevation == null || elevation >= 0.0),
        super(key: key);

  final Clip clipBehavior;
  final bool semanticContainer;
  final LinearGradient gradient;
  final double? elevation;
  final Color? shadowColor;

  ///Defines the height of the [GradientAppbar] widget.
  ///
  /// By default, the value of the `toolbarHeight` is [kToolbarHeight].
  final double toolbarHeight;

  ///A widget to display before the GradientAppbar's [title].
  final Widget? leading;

  ///A primary widget to display in the GradientAppbar
  final Widget? title;

  ///List of widgets to display in a row after the [title] widget.
  final List<Widget>? actions;

  ///Set alignment of the title widget
  //If `centerTitle` property is null, then [AppBarTheme.centerTitle] of [ThemeData.appBarTheme] is used. If that is also null, then value is adapted to the current [TargetPlatform].
  final bool? centerTitle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Semantics(
      container: semanticContainer,
      explicitChildNodes: !semanticContainer,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _getOverlayStyle(theme),
        child: Material(
          color: Colors.transparent,
          shadowColor: shadowColor ?? Colors.grey,
          elevation: elevation ?? 0,
          clipBehavior: clipBehavior,
          child: Container(
            height: toolbarHeight * 2,
            decoration: BoxDecoration(
              gradient: gradient,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  const SizedBox(width: 18),
                  if (leading != null) leading!,
                  if (_getResectiveCenterTitle(theme))
                    Expanded(
                      child: Center(
                        child: _title(),
                      ),
                    )
                  else
                    _title(),
                  if (actions != null && actions!.isNotEmpty)
                    Row(
                      children: actions!,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SystemUiOverlayStyle _getOverlayStyle(ThemeData theme) {
    return systemOverlayStyle ??
        theme.appBarTheme.systemOverlayStyle ??
        const SystemUiOverlayStyle();
  }

  bool _getResectiveCenterTitle(ThemeData theme) {
    bool platformCenterTitle() {
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return false;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return actions == null || actions!.length < 2;
      }
    }

    return centerTitle ??
        theme.appBarTheme.centerTitle ??
        platformCenterTitle();
  }

  Widget _title() => DefaultTextStyle(
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      child: title!);

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

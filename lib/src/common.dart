import 'package:flutter/material.dart';

Widget gradientContainer(BuildContext context, Gradient gradient, double incHeightBy, double incWidthBy, Widget child) {
  final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(padding: const EdgeInsets.all(0.0));
  return Container(
    height: buttonTheme.height + incHeightBy,
    width: buttonTheme.minWidth + incWidthBy,
    decoration: BoxDecoration(gradient: gradient),
    child: Center(child: child),
  );
}

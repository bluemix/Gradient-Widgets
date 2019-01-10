import 'package:flutter/material.dart';
import 'package:gradient_widgets/src/gradient_widget.dart';

class GradientText extends StatelessWidget {
  GradientText(
    this.data, {
    @required this.gradient,
    this.shaderRect,
    @required this.style,
    this.key,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  });

  final String data;
  final Key key;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final Gradient gradient;
  final Rect shaderRect;

  @override
  Widget build(BuildContext context) {
    return GradientWidget(
      key: key,
      gradient: gradient,
      forcedRect: shaderRect,
      child: Text(
        data,
        style: style,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
      ),
    );
  }
}

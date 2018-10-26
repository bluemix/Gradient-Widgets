import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText(
    this.data, {
    @required this.gradient,
    @required this.shaderRect,
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
    return Text(
      data,
      key: key,
      style: style.copyWith(
          foreground: Paint()..shader = gradient.createShader(shaderRect ?? Rect.fromLTWH(0.0, 0.0, 50.0, 50.0))),
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
    );
  }
}

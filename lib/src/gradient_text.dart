import 'package:flutter/material.dart';

import '../gradient_widgets.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.data, {
    required this.style,
    this.key,
    this.gradient = Gradients.hotLinear,
    this.shaderRect,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  final Key? key;
  final String data;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final Gradient gradient;
  final Rect? shaderRect;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      // Regarding the blend mode: The source is the gradient to draw, and the
      // destination is the text. With srcIn the gradient is drawn with the
      // shape of the text.
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => gradient.createShader(shaderRect ?? rect),
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

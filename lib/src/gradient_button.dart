import 'package:flutter/material.dart';

import '../gradient_widgets.dart';
import 'gradient_widget.dart';

class GradientButton extends GradientWidget {
  GradientButton(
      {this.gradient = Gradients.hotLinear,
      @required this.child,
      @required this.callback,
      this.shadowColor = Colors.black45,
      this.shape,
      this.shapeRadius,
      this.textStyle,
      this.elevation = 5.0,
      this.isEnabled = true,
      this.disabledGradient,
      this.increaseHeightBy = 0.0,
      this.increaseWidthBy = 0.0,
      this.constraints,
      this.heroTag,
      this.tooltip,
      this.materialTapTargetSize})
      : super(
            child: child,
            callback: callback,
            shadowColor: shadowColor,
            shape: shape,
            shapeRadius: shapeRadius,
            textStyle: textStyle,
            elevation: elevation,
            isEnabled: isEnabled,
            disabledGradient: disabledGradient,
            increaseHeightBy: increaseHeightBy,
            increaseWidthBy: increaseWidthBy,
            constraints: constraints,
            heroTag: heroTag,
            tooltip: tooltip,
            materialTapTargetSize: materialTapTargetSize);

  final Widget child;
  final Gradient gradient;
  final Color shadowColor;
  final Gradient disabledGradient;
  final VoidCallback callback;
  final ShapeBorder shape;
  final BorderRadius shapeRadius;
  final TextStyle textStyle;
  final bool isEnabled;
  final double elevation;
  final double increaseHeightBy;
  final double increaseWidthBy;
  final BoxConstraints constraints;
  final String tooltip;

  final Object heroTag;
  final MaterialTapTargetSize materialTapTargetSize;
}

import 'package:flutter/material.dart';

import '../gradient_widgets.dart';
import 'gradient_widget.dart';

class GradientButton extends GradientWidget {
  const GradientButton(
      {@required this.child,
      @required this.callback,
      Key key,
      this.gradient = Gradients.hotLinear,
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
            key: key,
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

  @override
  final Widget child;

  @override
  final Gradient gradient;

  @override
  final Color shadowColor;

  @override
  final Gradient disabledGradient;

  @override
  final VoidCallback callback;

  @override
  final ShapeBorder shape;

  @override
  final BorderRadius shapeRadius;

  @override
  final TextStyle textStyle;

  @override
  final bool isEnabled;

  @override
  final double elevation;

  @override
  final double increaseHeightBy;

  @override
  final double increaseWidthBy;

  @override
  final BoxConstraints constraints;

  @override
  final String tooltip;

  @override
  final Object heroTag;

  @override
  final MaterialTapTargetSize materialTapTargetSize;
}

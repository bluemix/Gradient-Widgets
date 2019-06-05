import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gradient_widgets.dart';

class CircularGradientButton extends GradientButton {
  CircularGradientButton(
      {this.gradient = Gradients.hotLinear,
      @required this.child,
      @required this.callback,
      this.shadowColor = Colors.black45,
      this.increaseHeightBy = 56.0,
      this.increaseWidthBy = 0.0,
      this.elevation = 5.0,
      this.materialTapTargetSize,
      this.heroTag,
      this.tooltip})
      : super(
            callback: callback,
            child: child,
            shadowColor: shadowColor,
            gradient: gradient,
            elevation: elevation,
            increaseHeightBy: increaseHeightBy,
            increaseWidthBy: increaseWidthBy,
            heroTag: heroTag,
            tooltip: tooltip,
            materialTapTargetSize: materialTapTargetSize,
            shape: CircleBorder(),
//            shape: RoundedRectangleBorder(),
            constraints: BoxConstraints.tightFor(
              width: 56.0,
              height: 56.0,
            )
  );

  final Widget child;
  final Gradient gradient;
  final Color shadowColor;

  final VoidCallback callback;
  final double elevation;
  final double increaseHeightBy;
  final double increaseWidthBy;
  final String tooltip;

  final Object heroTag;
  final MaterialTapTargetSize materialTapTargetSize;
}

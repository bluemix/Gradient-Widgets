import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gradient_widgets.dart';

class CircularGradientButton extends GradientButton {
  const CircularGradientButton(
      {@required this.child,
      @required this.callback,
      Key key,
      this.gradient = Gradients.hotLinear,
      this.shadowColor = Colors.black45,
      this.increaseHeightBy = 56.0,
      this.increaseWidthBy = 0.0,
      this.elevation = 5.0,
      this.materialTapTargetSize,
      this.heroTag,
      this.tooltip})
      : super(
            key: key,
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
            shape: const CircleBorder(),
//            shape: RoundedRectangleBorder(),
            constraints: const BoxConstraints.tightFor(
              width: 56.0,
              height: 56.0,
            ));

  @override
  final Widget child;

  @override
  final Gradient gradient;

  @override
  final Color shadowColor;

  @override
  final VoidCallback callback;

  @override
  final double elevation;

  @override
  final double increaseHeightBy;

  @override
  final double increaseWidthBy;

  @override
  final String tooltip;

  @override
  final Object heroTag;

  @override
  final MaterialTapTargetSize materialTapTargetSize;
}

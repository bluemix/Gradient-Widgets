import 'package:flutter/material.dart';
import 'package:gradient_widgets/src/common.dart';

class CircularGradientButton extends StatelessWidget {
  CircularGradientButton(
      {@required this.gradient,
      @required this.child,
      @required this.callback,
      this.increaseHeightBy = 30.0,
      this.increaseWidthBy = 0.0,
      this.elevation = 2.0,
      this.materialTapTargetSize,
      this.heroTag,
      this.tooltip});

  final Widget child;
  final Gradient gradient;
  final VoidCallback callback;
  final double elevation;
  final double increaseHeightBy;
  final double increaseWidthBy;
  final String tooltip;

  final Object heroTag;
  final MaterialTapTargetSize materialTapTargetSize;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: elevation,
      onPressed: callback,
      clipBehavior: Clip.antiAlias,
      heroTag: heroTag,
      materialTapTargetSize: materialTapTargetSize,
      tooltip: tooltip,
      child: gradientContainer(
          context, gradient, increaseHeightBy, increaseWidthBy, child),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gradient_widgets/src/common.dart';

class GradientButton extends StatefulWidget {
  GradientButton(
      {@required this.gradient,
      @required this.child,
      @required this.callback,
      this.shape,
      this.shapeRadius,
      this.textStyle,
      this.elevation = 5.0,
      this.isEnabled = true,
      this.disabledGradient,
      this.increaseHeightBy = 0.0,
      this.increaseWidthBy = 0.0});

  final Widget child;
  final Gradient gradient;
  final Gradient disabledGradient;
  final VoidCallback callback;
  final ShapeBorder shape;
  final BorderRadius shapeRadius;
  final TextStyle textStyle;
  final bool isEnabled;
  final double elevation;
  final double increaseHeightBy;
  final double increaseWidthBy;

  @override
  GradientButtonState createState() {
    return new GradientButtonState();
  }
}

class GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    BorderRadius borderRadiusCopy = widget.shapeRadius ?? BorderRadius.circular(20.0);
    ShapeBorder shapeCopy = widget.shape ?? RoundedRectangleBorder(borderRadius: borderRadiusCopy);
    TextStyle textStyleCopy = widget.textStyle ?? theme.textTheme.button.copyWith(color: Colors.white);

    Gradient gradient;
    double elevation;
    VoidCallback callback;

    if (widget.isEnabled) {
      gradient = widget.gradient;
      elevation = widget.elevation;
      callback = widget.callback;
    } else {
      elevation = 0.0;
      callback = null;
      gradient = widget.disabledGradient ??
          LinearGradient(
            stops: widget.gradient.stops,
            colors: const <Color>[
              Color(0xffDADADA), // <color name="mystic">#DADADA</color>
              Color(0xffBABEC3), // <color name="french_gray">#BABEC3</color>
            ],
          );
    }

    return Center(
      child: RawMaterialButton(
        fillColor: Colors.transparent,
        padding: const EdgeInsets.all(0.0),
        shape: shapeCopy,
        elevation: elevation,
        textStyle: textStyleCopy,
        onPressed: callback,
        clipBehavior: Clip.antiAlias,
        child: gradientContainer(context, gradient, widget.increaseHeightBy, widget.increaseWidthBy, widget.child),
      ),
    );
  }
}

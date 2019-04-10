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
    return GradientButtonState();
  }
}

class GradientButtonState extends State<GradientButton> with SingleTickerProviderStateMixin {
  Animation<double> _opacity;
  AnimationController animationController;
  bool isTappedUp = false;
  double elevation;

  Gradient gradient;
  VoidCallback callback;

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _opacity = Tween<double>(begin: 1.0, end: 0.8)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));

    elevation = widget.elevation;
    animationController.addStatusListener((status) {
      if (animationController.isCompleted && isTappedUp) {
        animationController.reverse();
      }
    });

    super.initState();
  }

  void tapDown() {
    elevation = 0.0;
    animationController.forward();
    isTappedUp = false;
    setState(() {});
  }

  void tapUp() {
    elevation = widget.elevation * 2;
    if (!animationController.isAnimating) {
      animationController.reverse();
    }
    isTappedUp = true;
    setState(() {});
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    BorderRadius borderRadiusCopy = widget.shapeRadius ?? BorderRadius.circular(20.0);
    ShapeBorder shapeCopy = widget.shape ?? RoundedRectangleBorder(borderRadius: borderRadiusCopy);
    TextStyle textStyleCopy = widget.textStyle ?? theme.textTheme.button.copyWith(color: Colors.white);

    if (widget.isEnabled) {
      gradient = widget.gradient;
      callback = widget.callback;
    } else {
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

    return GestureDetector(
      onTapDown: (details) => tapDown(),
      onTapUp: (details) => tapUp(),
      onTapCancel: () => tapUp(),
      child: Center(
        child: RawMaterialButton(
          fillColor: Colors.transparent,
          padding: const EdgeInsets.all(0.0),
          shape: shapeCopy,
          elevation: elevation,
          textStyle: textStyleCopy,
          onPressed: () {
            tapDown();
            tapUp();
            callback();
          },
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: FadeTransition(
            opacity: _opacity,
            child: gradientContainer(context, gradient, widget.increaseHeightBy, widget.increaseWidthBy, widget.child),
          ),
        ),
      ),
    );
  }
}

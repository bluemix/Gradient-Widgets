import 'package:flutter/material.dart';
import 'package:gradient_widgets/src/common.dart';

import '../gradient_widgets.dart';

class GradientWidget extends StatefulWidget {
  GradientWidget(
      {this.gradient = Gradients.hotLinear,
        @required this.child,
        this.callback,
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
        this.materialTapTargetSize});

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

    _opacity = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);

    elevation = widget.elevation;
    animationController.addStatusListener((status) {
      if (animationController.isCompleted && isTappedUp) {
        animationController.reverse();
      }
    });

    super.initState();
  }

  void tapDown() {
    animationController.forward();
    isTappedUp = false;
    setState(() {});
  }

  void tapUp() {
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
    print('_opacity.value: ${_opacity.value}');

    final ThemeData theme = Theme.of(context);

    BorderRadius borderRadiusCopy = widget.shapeRadius ?? BorderRadius.circular(40.0);
//    ShapeBorder shapeCopy = widget.shape ?? RoundedRectangleBorder(borderRadius: borderRadiusCopy);
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

    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(padding: const EdgeInsets.all(0.0));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => widget.callback(),
      onTapDown: (TapDownDetails details) => tapDown(),
      onTapCancel: () => tapUp(),
      onTapUp: (TapUpDetails details) => tapUp(),
      child: Center(
        child: PhysicalShape(
          color: Colors.transparent,
          shadowColor: widget.shadowColor,
          elevation: elevation,
          clipper: ShapeBorderClipper(shape: shapeCopy),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: RawMaterialButton(
              fillColor: Colors.transparent,
              padding: const EdgeInsets.all(0.0),
              shape: shapeCopy,
              elevation: 0.0,
              textStyle: textStyleCopy,
              onPressed: null,
              constraints: widget.constraints ??
                  BoxConstraints.loose(Size(
                      buttonTheme.minWidth + widget.increaseWidthBy, buttonTheme.height + widget.increaseHeightBy)),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: <Widget>[
                  gradientContainer(context, gradient, widget.increaseHeightBy, widget.increaseWidthBy, widget.child),
                  FadeTransition(
                      opacity: _opacity,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black12])),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}

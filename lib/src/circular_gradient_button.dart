import 'package:flutter/material.dart';
import 'package:gradient_widgets/src/common.dart';

class CircularGradientButton extends StatefulWidget {
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
  _CircularGradientButtonState createState() => _CircularGradientButtonState();
}

class _CircularGradientButtonState extends State<CircularGradientButton> with SingleTickerProviderStateMixin {

  Animation<double> _opacity;
  AnimationController animationController;
  bool isTappedUp = false;
  double elevation;

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


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  dispose() {
    animationController.dispose();
    super.dispose();
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
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => widget.callback(),
        onTapDown: (TapDownDetails details) => tapDown(),
        onTapCancel: () => tapUp(),
        onTapUp: (TapUpDetails details) => tapUp(),
        child: FloatingActionButton(
          elevation: elevation,
          onPressed: null,
          clipBehavior: Clip.antiAlias,
          heroTag: widget.heroTag,
          materialTapTargetSize: widget.materialTapTargetSize,
          tooltip: widget.tooltip,
          child: Stack(
            children: [
              gradientContainer(
                  context, widget.gradient, widget.increaseHeightBy, widget.increaseWidthBy, widget.child),
              FadeTransition(
                opacity: _opacity,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black38])),
                ),
              ),
            ],
          ),
        ));
  }
}

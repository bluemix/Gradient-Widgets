import 'dart:math';

import 'package:flutter/material.dart';

import '../gradient_widgets.dart';

const double _kCircularProgressIndicatorHeight = 6.0;
const int _kIndeterminateCircularDuration = 1800;

class GradientCircularProgressIndicator extends StatefulWidget {
  const GradientCircularProgressIndicator(
      {this.value, this.gradient = Gradients.hotLinear, this.radius = 200});

  final double? value;
  final Gradient gradient;
  final double radius;

  @override
  State<StatefulWidget> createState() {
    return _GradientCircularProgressIndicatorState();
  }
}

class _GradientCircularProgressIndicatorState
    extends State<GradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> pAnimation;
  List<Color> colors = [];

  double? prevValue = 0.0;

  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();

    assert(widget.gradient.colors.length == 2,
        'gradient must have two colors only');

    _setColorsArray();

    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateCircularDuration),
      vsync: this,
    );

    _setControllerListener();

    curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    pAnimation = Tween<double>(begin: prevValue, end: widget.value ?? 100)
        .animate(curvedAnimation);
    prevValue = widget.value ?? 0;

    _controller.forward();
  }

  void _setColorsArray() {
    colors.clear();
    colors.addAll(widget.gradient.colors);
    colors.add(widget.gradient.colors.first);
  }

  void _setControllerListener() {
    if (widget.value == null) {
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.dismissed && widget.value == null) {
          _controller.forward();
        } else if (status == AnimationStatus.completed &&
            widget.value == null) {
          _controller.reverse();
          // _controller.forward();
          // colors = colors.reversed.toList();
        }
      });
    }
  }

  @override
  void didUpdateWidget(GradientCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    _setColorsArray();

    _setControllerListener();

    if (widget.value == null && !_controller.isAnimating) {
      _controller.reset();
    } else if (widget.value != null) {
      pAnimation = Tween<double>(begin: prevValue, end: widget.value)
          .animate(curvedAnimation);
      _controller
        ..reset()
        ..forward();
      prevValue = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void stopAnimation() {
    _controller.stop();
  }

  Widget _buildCircularIndicator(BuildContext context, double animationValue) {
    // print('_buildCircularIndicator, animationValue: ${animationValue}');
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: widget.radius,
      height: widget.radius,
      child: CustomPaint(
        foregroundPainter: RadialPainter(
            bgColor: colors.first,
            lineColor: colors.last,
            percent: animationValue,
            gradientColors: colors.take(2).toList(),
            strokeWidth: _kCircularProgressIndicatorHeight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pAnimation,
      builder: (BuildContext context, Widget? child) {
        return _buildCircularIndicator(context, pAnimation.value);
      },
    );
  }
}

class RadialPainter extends CustomPainter {
  RadialPainter(
      {required this.bgColor,
      required this.lineColor,
      required this.strokeWidth,
      required this.percent,
      required this.gradientColors});

  final Color bgColor;
  final Color lineColor;
  final double strokeWidth;
  final double percent;
  final List<Color> gradientColors;

  Paint getPaint(Color color, double circleWidth) {
    return Paint()
      ..color = color
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint bgLine = getPaint(bgColor, strokeWidth);

    final Paint progressLine = getPaint(lineColor, strokeWidth);

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);
    final double endAngle = 2 * pi * (percent / 100);
    const double startAngle = -pi / 2;

    // print('percent: ${percent}');
    // print('radius: ${radius}');
    // print('width: ${size.width}');
    // print('height: ${size.height}');
    // print('startAngle: $startAngle');
    // print('endAngle: $endAngle');
    // convert linear gradient to sweep
    final _gradient = SweepGradient(
      startAngle: 3 * pi / 2,
      endAngle: 7 * pi / 2,
      tileMode: TileMode.repeated,
      colors: gradientColors,
    );

    // adding the gradient
    progressLine.shader = _gradient.createShader(
        Rect.fromCenter(height: radius, center: center, width: radius));
    canvas.drawCircle(center, radius, bgLine);

    // draw the progress
    canvas.drawArc(
        Rect.fromCenter(
          center: center,
          width: radius * 2,
          height: radius * 2,
        ),
        startAngle,
        endAngle,
        false,
        progressLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

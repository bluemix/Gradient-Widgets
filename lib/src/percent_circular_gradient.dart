import 'dart:math';

import 'package:flutter/material.dart';

import '../gradient_widgets.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress(
      {this.progressColor = Colors.yellow,
      this.bcgColor = Colors.grey,
      this.progress,
      this.gradient = Gradients.hotLinear,
      this.size = 200});

  final Color progressColor;
  final Color bcgColor;
  final double progress;
  final Gradient gradient;
  final double size;

  @override
  State<StatefulWidget> createState() {
    return CircularProgressState();
  }
}

class CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        foregroundPainter: RadialPainter(
            bgColor: widget.bcgColor,
            lineColor: widget.progressColor,
            percent: widget.progress,
            gradient: widget.gradient,
            strokeWidth: 15.0),
        child: Center(
          child: Text(
            widget.progress > 100
                ? "100\%"
                : '${(widget.progress).toStringAsPrecision(2)}\%',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  RadialPainter(
      {this.bgColor,
      this.lineColor,
      this.strokeWidth,
      this.percent,
      this.gradient});

  final Color bgColor;
  final Color lineColor;
  final double strokeWidth;
  final double percent;
  final Gradient gradient;

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
    final double endAngle = 2 * pi * percent / 100;
    final double startAngle = -pi / 2;

    // convert linear gradient to sweep
    final _gradient = SweepGradient(
      startAngle: 3 * pi / 2,
      endAngle: 7 * pi / 2,
      tileMode: TileMode.repeated,
      colors: gradient.colors,
    );

    // adding the gradient
    progressLine.shader = _gradient.createShader(
        Rect.fromCenter(height: radius, center: center, width: radius));
    canvas.drawCircle(center, radius, bgLine);

    // draw the progress
    canvas.drawArc(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.width,
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

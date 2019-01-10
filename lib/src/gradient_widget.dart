import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Widget that places a [Gradient] on its child.
class GradientWidget extends StatelessWidget {

  final Gradient gradient;
  final Widget child;
  /// When null (default), use the size of the widget. Otherwise force-apply
  /// this rect when creating the widget.
  final Rect forcedRect;

  GradientWidget({@required this.gradient, @required this.child, this.forcedRect, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => gradient.createShader(forcedRect ?? rect),
      child: child,
    );
  }
}

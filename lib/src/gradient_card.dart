// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientCard extends StatelessWidget {
  /// Creates a material design card.
  ///
  /// The [clipBehavior] argument must not be null.
  const GradientCard({
    Key key,
    @required this.gradient,
    this.shape,
    this.margin = const EdgeInsets.all(4.0),
    this.clipBehavior = Clip.none,
    this.child,
    this.semanticContainer = true,
  }) : super(key: key);

  final ShapeBorder shape;
  final Clip clipBehavior;
  final EdgeInsetsGeometry margin;
  final bool semanticContainer;
  final Widget child;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
//    var shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
    return Semantics(
      container: semanticContainer,
      explicitChildNodes: !semanticContainer,
      child: Container(
        margin: margin ?? const EdgeInsets.all(4.0),
        decoration: shape ??
            ShapeDecoration(
                shape: shape ??
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                gradient: gradient),
        child: Material(
          type: MaterialType.card,
          color: Colors.transparent,
          elevation: 0.0,
          shape: shape ??
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
          clipBehavior: clipBehavior,
          child: child,
        ),
      ),
    );
  }
}

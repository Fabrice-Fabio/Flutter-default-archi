import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildBlur({
  required Widget child,
  required BorderRadius borderRadius,
  double sigmaX = 10,
  double sigmaY = 10,
}) => Padding(
  padding: const EdgeInsets.all(5.0),
  child:   ClipRRect(
    borderRadius: borderRadius,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: child,
    ),
  ),
);
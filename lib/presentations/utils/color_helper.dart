import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ColorHelper {
  Color generateColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}

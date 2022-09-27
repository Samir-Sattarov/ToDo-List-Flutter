import 'dart:math';

import 'package:flutter/material.dart';

class ColorHelper {
  MaterialColor generateColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}

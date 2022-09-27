import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Dialogs {
  static colorPickerDialog({
    required BuildContext context,
    required Function(Color) onChanged,
    required Color? initialColor,
    required Color? pickedColor,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: HueRingPicker(
              displayThumbColor: true,
              pickerColor: initialColor == null
                  ? Colors.grey.shade400
                  : pickedColor ?? Colors.black38,
              onColorChanged: (Color color) => onChanged(color),
            ),
          ),
        );
      },
    );
  }
}

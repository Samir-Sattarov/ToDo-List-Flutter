import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final Color? color;

  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => isPressed = true),
      onPointerUp: (_) => setState(() => isPressed = false),
      child: GestureDetector(
        onTap: () => widget.onTap.call(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.maxFinite,
          height: 64,
          decoration: BoxDecoration(
            color: widget.color ?? Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(
              14,
            ),
            boxShadow: isPressed
                ? [
                    BoxShadow(
                      color: Colors.black38,
                      offset: -const Offset(1, 1),
                      blurRadius: 10,
                      inset: isPressed,
                    ),
                    BoxShadow(
                      color: Colors.black38,
                      offset: const Offset(1, 1),
                      blurRadius: 10,
                      inset: isPressed,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatefulWidget {
  String text;
  double? size;
  Color? color;
  FontWeight? weight;
  bool? isShadow;
  CustomText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.isShadow});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  DateTime date = DateTime.now();
  getColor() {
    bool isDay = date.hour > 6 && date.hour < 17 ? true : false;

    if (widget.color != null) {
      return widget.color;
    } else {
      return isDay ? Colors.black : Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: GoogleFonts.poppins(
            shadows: [
              (widget.isShadow ?? false)
                  ? const Shadow(
                      blurRadius: 10.0,
                      color: Colors.purple,
                      offset: Offset(0.0, 2.0),
                    )
                  : const Shadow(
                      blurRadius: 0.0,
                      color: Colors.transparent,
                      offset: Offset(0.0, 0.0),
                    )
            ],
            fontSize: widget.size ?? 20,
            color: getColor(),
            fontWeight: widget.weight ?? FontWeight.normal));
  }
}

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
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: GoogleFonts.poppins(
            shadows: [
              (widget.isShadow ?? false)
                  ? const Shadow(
                      blurRadius: 10.0, // shadow blur
                      color: Colors.black, // shadow color
                      offset: Offset(0.0, 2.0), // how much shadow will be shown
                    )
                  : const Shadow(
                      blurRadius: 0.0, // shadow blur
                      color: Colors.transparent, // shadow color
                      offset: Offset(0.0, 0.0), // how much shadow will be shown
                    )
            ],
            fontSize: widget.size ?? 20,
            color: widget.color ?? Colors.black,
            fontWeight: widget.weight ?? FontWeight.normal));
  }
}

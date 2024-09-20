import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilis/color.dart';

class NunitoText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontSize;

  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final Color decorationColor;
  final int? maxLines;

  const NunitoText({
    super.key,
    required this.text,
    this.fontSize,
    this.maxLines,
    this.textColor = AppColor.black,
    this.fontWeight = FontWeight.w500,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.decorationColor = AppColor.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.nunito(
          fontSize: fontSize ?? 14,
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          decoration: textDecoration,
          decorationColor: decorationColor),
    );
  }
}

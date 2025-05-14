import 'package:astro_sagga/core/app_color.dart';
import 'package:flutter/material.dart';

Text appText(
    String text, {
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal,
      Color color = AppColors.textColor,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLines,
      TextStyle? style,
      List<Shadow>? shadows,

    }) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    style: style ??
        TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
        ),
  );
}

import 'package:flutter/material.dart';

import 'font_family.dart';

class AppTextStyle {
  const AppTextStyle._();

  static Widget getNunitoRegular(String text, double size, Color color,
      {TextAlign align = TextAlign.start,
      int maxLines = 1,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.NunitoRegular,
          decoration: TextDecoration.none),
    );
  }
}

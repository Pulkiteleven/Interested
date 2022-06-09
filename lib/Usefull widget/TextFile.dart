import 'package:flutter/material.dart';

Color text = Color(0xFFB300FF);


Text mainText(String text, Color c, double size, FontWeight w) {
  return Text(
    text,
    style: TextStyle(
      color: c,
      fontSize: size,
      fontFamily: 'mons',
      fontWeight: w,
    ),
  );
}
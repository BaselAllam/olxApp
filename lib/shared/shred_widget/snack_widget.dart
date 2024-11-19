import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';



SnackBar snackBar(String content, Color color) {
  return SnackBar(
    content: Text(content, style: AppFonts.subWhiteyTextStyle),
    duration: Duration(seconds: 2),
    backgroundColor: color
  );
}
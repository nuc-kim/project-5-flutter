import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  // Theme Related
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  // MediaQuery Related
  MediaQueryData get mediaQueryData => MediaQuery.of(this);
  Size get size => mediaQueryData.size;
  double get width => size.width;
  double get height => size.height;
}

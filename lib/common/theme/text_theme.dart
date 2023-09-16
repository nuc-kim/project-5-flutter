import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/theme/color_scheme.dart';

class ProjectFiveTextTheme {
  static double _heightCorrection({required double fontSize}) {
    if (fontSize > 19) return fontSize + 4;
    return fontSize + 2;
  }

  static TextStyle _regularTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontSize: fontSize,
      height: _heightCorrection(fontSize: fontSize) / fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _boldTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w700,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontSize: fontSize,
      height: _heightCorrection(fontSize: fontSize) / fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static TextTheme textTheme = TextTheme(
    titleLarge: _boldTextStyle(fontSize: 20),
    titleMedium: _boldTextStyle(fontSize: 18),
    titleSmall: _boldTextStyle(fontSize: 16),
    labelLarge: _boldTextStyle(fontSize: 16),
    labelMedium: _regularTextStyle(fontSize: 14),
    labelSmall: _regularTextStyle(fontSize: 12),
    bodyLarge: _regularTextStyle(fontSize: 18),
    bodyMedium: _regularTextStyle(fontSize: 16),
    bodySmall: _regularTextStyle(fontSize: 14),
  ).apply(
    bodyColor: ProjectFiveColorScheme.black,
    displayColor: ProjectFiveColorScheme.black,
  );
}

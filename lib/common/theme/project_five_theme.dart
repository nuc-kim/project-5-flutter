import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/theme/color_scheme.dart';
import 'package:project_5_flutter/common/theme/text_theme.dart';

class ProjectFiveTheme {
  final bool isDarkMode;

  ProjectFiveTheme({
    required this.isDarkMode,
  });

  ThemeData get themeData => ThemeData(
    colorScheme: isDarkMode
        ? ProjectFiveColorScheme.darkColorScheme
        : ProjectFiveColorScheme.lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: ProjectFiveColorScheme.lightColorScheme.background,
      foregroundColor: ProjectFiveColorScheme.lightColorScheme.onBackground,
    ),
    fontFamily: 'NanumSquareNeo',
    textTheme: ProjectFiveTextTheme.textTheme,
  );
}

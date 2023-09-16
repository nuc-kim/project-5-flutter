import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_5_flutter/common/router/go_router.dart';
import 'package:project_5_flutter/common/theme/project_five_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ProjectFiveApp(),
    ),
  );
}

class ProjectFiveApp extends ConsumerWidget {
  const ProjectFiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ProjectFiveTheme(isDarkMode: false).themeData,
        darkTheme: ProjectFiveTheme(isDarkMode: true).themeData,
      ),
    );
  }
}

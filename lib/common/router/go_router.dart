import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_5_flutter/common/view/root_screen.dart';
import 'package:project_5_flutter/common/view/splash_screen.dart';
import 'package:project_5_flutter/home/view/home.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) => ProjectFiveRouter.router,
);

class ProjectFiveRouter {
  static final router = GoRouter(
    initialLocation: SplashScreen.path,
    routes: [
      GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.path,
        builder: (_, __) => const SplashScreen(),
        routes: [
          GoRoute(
            path: RootScreen.path,
            name: RootScreen.path,
            builder: (_, __) => const RootScreen(),
          ),
        ],
      ),
    ],
  );
}

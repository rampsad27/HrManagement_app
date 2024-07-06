import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_app_redo/presentation/login/log_in_screen.dart';
import 'package:hr_app_redo/presentation/logout/log_out_screen.dart';
import 'package:hr_app_redo/presentation/user/user_detail/user_detail_screen.dart';
import 'package:hr_app_redo/presentation/user/user_list/user_list_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: "/",
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (context, state) => const LogInScreen(),
          routes: [
            GoRoute(
                path: 'userlist',
                builder: (context, state) => const UserListScreen(),
                routes: [
                  GoRoute(
                    path: 'userdetail',
                    builder: (context, state) {
                      final userId = state.extra as String;
                      return UserDetailScreen(userId: userId);
                    },
                  ),
                ]),
            GoRoute(
              path: 'logout',
              builder: (context, state) => const LogOutScreen(),
            )
          ]),
    ],
  );
}

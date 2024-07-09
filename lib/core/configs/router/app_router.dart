import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_app_redo/presentation/chat/chatUserListScreen.dart';
import 'package:hr_app_redo/presentation/common/getting_started_screen.dart';
import 'package:hr_app_redo/presentation/login/forgot_password_screen.dart';
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
          builder: (context, state) =>
              const GettingStartedScreen(), // Define the getting started screen route
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => const LogInScreen(),
            ),
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
            ),
            GoRoute(
              path: 'forgotpassword',
              builder: (context, state) => const ForgotPasswordScreen(),
            ),
            GoRoute(
              path: 'chat',
              builder: (context, state) => const ChatUserListScreen(),
            )
          ]),
    ],
  );
}

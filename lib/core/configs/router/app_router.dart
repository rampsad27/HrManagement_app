import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:HrManagement/presentation/chat/chatUserListScreen.dart';
import 'package:HrManagement/presentation/common/getting_started_screen.dart';
import 'package:HrManagement/presentation/favourite/favourite_screen.dart';
import 'package:HrManagement/presentation/login/forgot_password_screen.dart';
import 'package:HrManagement/presentation/login/log_in_screen.dart';
import 'package:HrManagement/presentation/logout/log_out_screen.dart';
import 'package:HrManagement/presentation/user/user_detail/user_detail_screen.dart';
import 'package:HrManagement/presentation/user/user_list/user_list_screen.dart';

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
              path: 'favourite',
              builder: (context, state) => const FavouriteScreen(),
            ),
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

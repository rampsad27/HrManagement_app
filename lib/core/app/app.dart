import 'package:flutter/material.dart';
import 'package:hr_app_redo/core/configs/router/app_router.dart';

class HrManagementApp extends StatelessWidget {
  const HrManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

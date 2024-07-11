import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:HrManagement/core/configs/localization/locales.dart';
import 'package:HrManagement/core/configs/router/app_router.dart';

class HrManagementApp extends StatefulWidget {
  const HrManagementApp({super.key});

  @override
  State<HrManagementApp> createState() => _HrManagementAppState();
}

class _HrManagementAppState extends State<HrManagementApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  // This widget is the root of your application.
  @override
  void initState() {
    configureLocalization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      routerConfig: AppRouter.router,
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "ne");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }
}

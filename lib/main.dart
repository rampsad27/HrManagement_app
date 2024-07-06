import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_redo/core/app/app_provider.dart';
import 'package:hr_app_redo/core/service_locator/service_locator.dart';
import 'package:hr_app_redo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const AppProvider());
}

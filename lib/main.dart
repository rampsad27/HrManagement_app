import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:HrManagement/core/app/app_provider.dart';
import 'package:HrManagement/core/service_locator/service_locator.dart';
import 'package:HrManagement/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setup();
  runApp(const AppProvider());
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hr_app_redo/core/app/app.dart';
import 'package:hr_app_redo/core/service_locator/service_locator.dart';
import 'package:hr_app_redo/presentation/login/bloc/login_bloc.dart';
import 'package:hr_app_redo/presentation/login/google_sign_in/bloc/googlesignin_bloc.dart';
import 'package:hr_app_redo/presentation/user/bloc/user_details_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt.get<UserDetailsBloc>()..add(GetUserEvent()),
        ),
        BlocProvider(
            create: (context) => LogInBloc()..add(CheckLoggedInUser())),
        BlocProvider(create: (context) => GooglesigninBloc())
      ],
      child: const HrManagementApp(),
    );
  }
}

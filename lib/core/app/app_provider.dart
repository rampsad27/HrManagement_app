import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:HrManagement/core/app/app.dart';
import 'package:HrManagement/core/service_locator/service_locator.dart';
import 'package:HrManagement/presentation/favourite/bloc/favourite_user_bloc.dart';

import 'package:HrManagement/presentation/login/bloc/login_bloc.dart';
import 'package:HrManagement/presentation/login/google_sign_in/bloc/googlesignin_bloc.dart';
import 'package:HrManagement/presentation/user/bloc/user_details_bloc.dart';

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
            create: (context) =>
                getIt.get<LogInBloc>()..add(CheckLoggedInUser())),
        BlocProvider(create: (context) => getIt.get<GooglesigninBloc>()),
        BlocProvider(create: (context) => getIt.get<FavouriteUserBloc>()),
      ],
      child: const HrManagementApp(),
    );
  }
}

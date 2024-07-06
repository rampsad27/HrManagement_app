import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_app_redo/presentation/common/bottom_navigation_bar.dart';
import 'package:hr_app_redo/presentation/login/bloc/login_bloc.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            context.go("/");
          }
        },
        child: Center(
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LogInBloc>(context).add(LogOutRequested());
                },
                child: const Text("Logout"))),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}

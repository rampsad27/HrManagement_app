import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_app_redo/presentation/login/bloc/login_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LogInBloc>().add(CheckLoggedInUser());
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      context
          .read<LogInBloc>()
          .add(LogInRequested(email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInBloc, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccess || state is Authenticated) {
          try {
            context.go("/userlist");
          } catch (e) {
            log(" HERE is ERROR: $e ");
          }
        } else if (state is LogInFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Center(
              child: SizedBox(
                height: 200,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          fillColor: Colors.amber,
                          border: OutlineInputBorder(),
                          hintText: 'Email'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          fillColor: Colors.amber,
                          border: OutlineInputBorder(),
                          hintText: 'Password'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<LogInBloc, LogInState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              state is LogInLoadInProgress ? null : _login();
                            },
                            child: const Text("LogIn"));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:HrManagement/data/respository/googleSignIn_repository.dart';
import 'package:HrManagement/presentation/login/bloc/login_bloc.dart';

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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          context.go('/forgotpassword');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue),
                        )),
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        GoogleSignInRepository googleSignInRepository =
                            GoogleSignInRepository();
                        await googleSignInRepository.signInWithGoogle();
                      },
                      child: const Center(
                        child: Text("Sign in with Google "),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
}

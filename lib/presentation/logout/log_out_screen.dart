import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:HrManagement/presentation/common/bottom_navigation_bar.dart';
import 'package:HrManagement/presentation/login/bloc/login_bloc.dart';
import 'package:HrManagement/presentation/user/bloc/user_details_bloc.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;

    // Default to English if no current locale is set
    _currentLocale = _flutterLocalization.currentLocale?.languageCode ?? 'en';
    if (_currentLocale != 'en' && _currentLocale != 'ne') {
      _currentLocale = 'en';
    }

    // Set the initial locale
    _setLocale(_currentLocale);
    print(_currentLocale);
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: _currentLocale,
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text("English"),
                  ),
                  DropdownMenuItem(
                    value: 'ne',
                    child: Text("Nepali"),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    // Dispatch ChangeLocaleEvent
                    context
                        .read<UserDetailsBloc>()
                        .add(ChangeLocaleEvent(value));
                    _setLocale(value);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LogInBloc>(context).add(LogOutRequested());
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  void _setLocale(String? value) {
    if (value == null) return;
    _flutterLocalization.translate(value);
    setState(() {
      _currentLocale = value;
    });
  }
}

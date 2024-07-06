import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              context.go('/userlist');
            },
            child: const Icon(Icons.home_rounded),
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                context.go('/logout');
              },
              child: const Icon(Icons.account_circle_rounded)),
          label: '',
        ),
      ],
    );
  }
}

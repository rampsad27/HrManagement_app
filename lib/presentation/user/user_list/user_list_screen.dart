import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hr_app_redo/presentation/common/bottom_navigation_bar.dart';
import 'package:hr_app_redo/presentation/user/user_list/widgets/list_view_builder.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 233, 246),
      appBar: AppBar(
        title: const Center(child: Text("Candidates")),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: const ListViewVertical(),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}

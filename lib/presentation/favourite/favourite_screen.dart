import 'package:flutter/material.dart';
import 'package:hr_app_redo/presentation/user/common/user_list_details.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: Container(
        //   height: 140,
        //   margin: const EdgeInsets.fromLTRB(8, 10, 8, 0),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: UserListDetails(
        //       user: user,
        //     ),
        //   ),
        // ),
        );
  }
}

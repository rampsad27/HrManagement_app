import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_redo/presentation/user/bloc/user_details_bloc.dart';
import 'package:hr_app_redo/presentation/user/common/user_list_details.dart';
import 'package:hr_app_redo/presentation/user/user_detail/widgets/tab_bar_view.dart';

import 'package:url_launcher/url_launcher.dart';

class UserDetailScreen extends StatefulWidget {
  final String userId;
  const UserDetailScreen({
    super.key,
    required this.userId,
  });

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserDetailsBloc>().add(GetUserByIdEvent(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state.userDetailsStateEnum == UserDetailsStateEnum.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.userModel != null) {
          final user = state.userModel!;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 219, 233, 246),
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
            ),
            body: Column(
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: UserListDetails(
                      user: user,
                      locale: '',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: DefaultTabController(
                      length: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Column(
                          children: [
                            TabBar(
                              tabs: [
                                Tab(text: 'Information'),
                                Tab(text: 'Bio'),
                                Tab(text: 'SOS'),
                              ],
                            ),
                            AppTabBarView(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state.error != null) {
          return Center(
            child: Text(state.error!),
          );
        } else {
          return const Center(
            child: Text("No Data Found"),
          );
        }
      },
    );
  }
}

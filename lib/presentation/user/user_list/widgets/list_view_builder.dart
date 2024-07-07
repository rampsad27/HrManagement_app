import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_app_redo/presentation/user/bloc/user_details_bloc.dart';
import 'package:hr_app_redo/presentation/user/common/user_list_details.dart';

import 'package:url_launcher/url_launcher.dart';

class ListViewVertical extends StatefulWidget {
  const ListViewVertical({
    super.key,
  });

  @override
  State<ListViewVertical> createState() => _ListViewVerticalState();
}

class _ListViewVerticalState extends State<ListViewVertical> {
  @override
  Widget build(BuildContext context) {
    // final appColor = context.appColor;
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state.userDetailsStateEnum == UserDetailsStateEnum.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.userModelList != null
            //  &&
            //     state.userModelList!.isNotEmpty
            ) {
          return ListView.builder(
            itemCount: state.userModelList!.length,
            itemBuilder: (context, index) {
              final user = state.userModelList![index];
              return InkWell(
                onTap: () {
                  context.go('/userlist/userdetail', extra: user.email);
                },
                child: Container(
                  height: 140,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UserListDetails(
                      user: user,
                      locale: '',
                    ),
                  ),
                ),
              );
            },
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

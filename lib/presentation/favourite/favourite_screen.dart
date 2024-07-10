import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_redo/presentation/common/bottom_navigation_bar.dart';
import 'package:hr_app_redo/presentation/favourite/bloc/favourite_user_bloc.dart';
import 'package:hr_app_redo/presentation/user/common/user_list_details.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteBloc = BlocProvider.of<FavouriteUserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Users'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavouriteUserBloc, FavouriteUserState>(
        builder: (context, state) {
          if (state.favouriteUserStateEnum == FavouriteUserStateEnum.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.favouriteUserModel != null) {
            return state.favouriteUserModel!.emails.isEmpty
                ? const Center(
                    child: Text("No Favorite Users Available"),
                  )
                : ListView.builder(
                    itemCount: state.favouriteUserModel!.emails.length,
                    itemBuilder: (context, index) {
                      final userEmail = state.favouriteUserModel!.emails[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 212, 214, 215)),
                              height: 40,
                              child: Center(child: Text(userEmail))),
                        ),
                      );
                    },
                  );
          } else if (state.error != null) {
            return Center(
              child: Text(state.error!),
            );
          } else {
            // Initial state or no data
            favouriteBloc
                .add(GetFavouriteUserByEmail()); // Trigger fetching data
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}

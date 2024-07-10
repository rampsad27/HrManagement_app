import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app_redo/data/models/user/user_model.dart';
import 'package:hr_app_redo/presentation/favourite/bloc/favourite_user_bloc.dart';
import 'package:hr_app_redo/presentation/user/bloc/user_details_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class UserListDetails extends StatelessWidget {
  final UserModel user;

  const UserListDetails({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        final String currentLocale = state.locale ?? 'en';
        final Uri viber = Uri.parse('viber://add?number=${user.viber}');
        final Uri whatsapp = Uri.parse('https://wa.me/${user.whatsapp}');
        final Uri email = Uri(
          scheme: 'mailto',
          path: user.email,
          query: 'subject=Hello&body=Hello%20World',
        );

        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.picture),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentLocale == 'ne'
                              ? user.name?.ne ?? 'नाम उपलब्ध छैन'
                              : user.name?.en ?? 'Name not available'),
                          Text(currentLocale == 'ne'
                              ? user.position?.ne ?? 'पद उपलब्ध छैन'
                              : user.position?.en ?? 'Position not available'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          launchUrl(viber);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.viber,
                          color: Color.fromARGB(255, 166, 140, 170),
                        )),
                    IconButton(
                        onPressed: () {
                          launchUrl(whatsapp);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                        )),
                    IconButton(
                        onPressed: () {
                          launchUrl(email);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.envelope,
                          color: Color.fromARGB(255, 201, 145, 128),
                        )),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text('Applied Date: ${user.appliedDate}'),
                    const Spacer(),
                    BlocBuilder<FavouriteUserBloc, FavouriteUserState>(
                      builder: (context, state) {
                        final isFavorited = state.favouriteUserModel?.emails
                                .contains(user.email) ??
                            false;
                        return IconButton(
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: isFavorited ? Colors.red : null,
                          ),
                          onPressed: () {
                            if (isFavorited) {
                              context.read<FavouriteUserBloc>().add(
                                    DeleteFavouriteUserByEmail(
                                        email: user.email),
                                  );
                            } else {
                              context.read<FavouriteUserBloc>().add(
                                    AddToFavouriteUserEvent(email: user.email),
                                  );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

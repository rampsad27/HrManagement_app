import 'package:get_it/get_it.dart';
import 'package:HrManagement/data/respository/favourite_repository.dart';
import 'package:HrManagement/data/respository/googleSignIn_repository.dart';
import 'package:HrManagement/data/respository/login_repository.dart';
import 'package:HrManagement/data/respository/user_repository.dart';
import 'package:HrManagement/domain/repository/ifavourite_repository.dart';
import 'package:HrManagement/domain/repository/igoogleSignIn_repository.dart';
import 'package:HrManagement/domain/repository/ilogin_repository.dart';
import 'package:HrManagement/domain/repository/iuser_repository.dart';

abstract class InitRepository {
  static void init() {
    GetIt.I.registerSingleton<IUserRepository>(UserRepository());
    GetIt.I.registerSingleton<ILogInRepository>(LogInRepository());
    GetIt.I
        .registerSingleton<IgoogleSignInRepository>(GoogleSignInRepository());
    GetIt.I
        .registerSingleton<IFavouriteUserRepository>(FavouriteUserRepository());
  }
}

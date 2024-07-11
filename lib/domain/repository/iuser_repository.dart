import 'package:HrManagement/data/models/user/user_model.dart';

abstract interface class IUserRepository {
  Future<List<UserModel>?> getUser();

  Future<UserModel?> getUserById(String email);

  Stream<List<UserModel>> getRealTimeStreamData();
}

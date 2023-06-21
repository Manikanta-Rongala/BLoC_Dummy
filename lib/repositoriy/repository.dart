import 'package:bloc_dummy/api_repo/user_api_repository.dart';

import '../models/user_model.dart';

class Repository{

UserApiRepository userApiRepository =  UserApiRepository();
  Future<List<UserModel>> getUserData() => userApiRepository.getUserData();


}
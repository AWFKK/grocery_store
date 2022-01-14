import 'package:n_store/Helper/RequestManager.dart';
import 'package:n_store/ModelClasses/ModelLogin.dart';

class Repository {
  final reqManager = Requestmanager();

  //Login
  Future<UserLogin?> fetchUserLogin(dynamic param) =>
      reqManager.login(param);
}

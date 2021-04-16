import 'package:rechtum/services/authentication.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/view_models/base_model.dart';

class AuthViewModel extends BaseModel {
  get username => _authService.current.username;

  final AuthenticationService _authService = locator.get<AuthenticationService>();

  void login(String username, String name, String imageURL) {
    _authService.login(username, name, imageURL);
  }
}

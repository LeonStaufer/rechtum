import 'package:rechtum/services/authentication.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/view_models/base_model.dart';

class AuthViewModel extends BaseModel {
  get loggedIn => _authService.loggedIn;  
  get username => _authService.current.username;
  get name => _authService.current.name;
  get imageURL => _authService.current.imageURL;

  final AuthenticationService _authService = locator.get<AuthenticationService>();

  void login(String username, String name, String imageURL) {
    _authService.login(username, name, imageURL);
    setStatus(Status.idle);
  }
  
  void logout(){
    _authService.logout();
    setStatus(Status.idle);
  }
}

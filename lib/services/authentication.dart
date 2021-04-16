import 'package:rechtum/models/user.dart';

class AuthenticationService {
  User current = User.empty();
  bool loggedIn = false;

  void login(String username, String name, String imageURL) {
    current = User(username: username, name: name, imageURL: imageURL);
    loggedIn = true;
  }

  void logout() {
    current = User.empty();
    loggedIn = false;
  }
}
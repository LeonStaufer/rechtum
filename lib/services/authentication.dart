import 'package:rechtum/models/user.dart';

class AuthenticationService {
  User current = User.empty();

  void login(String username, String name, String imageURL) {
    current = User(username: username, name: name, imageURL: imageURL);
  }
}
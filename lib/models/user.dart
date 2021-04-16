class User {
  const User({
    required this.username,
    required this.name,
    required this.imageURL,
  });

  const User.empty()
      : username = "",
        name = "",
        imageURL = "";

  final String username;
  final String name;
  final String imageURL;
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rechtum/view_models/auth_view_model.dart';
import 'package:rechtum/view_models/chat_view_model.dart';
import 'package:rechtum/views/chat_page.dart';
import 'package:rechtum/views/home_page.dart';
import 'package:rechtum/views/welcome_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: "Opens Sans",
      primaryColorDark: Color(0xff0f3750),
      primaryColor: Color(0xff0076b8),
      primaryColorLight: Color(0xff53a7d5),
      accentColor: Color(0xff51a4d1),
      textTheme: TextTheme(
        headline1: TextStyle(fontFamily: "IBM Plex Sans"),
        headline2: TextStyle(fontFamily: "IBM Plex Sans"),
        headline3: TextStyle(fontFamily: "IBM Plex Sans"),
        headline4: TextStyle(fontFamily: "IBM Plex Sans"),
        headline5: TextStyle(fontFamily: "IBM Plex Sans"),
        headline6: TextStyle(fontFamily: "IBM Plex Sans"),
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<ChatViewModel>(create: (_) => ChatViewModel()),
      ],
      child: MaterialApp(
        title: "RechTUM",
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: "/welcome",
        routes: {
          "/welcome": (_) => WelcomePage(),
          "/": (_) => HomePage(),
          "/chat": (_) => ChatPage(),
        },
      ),
    );
  }
}

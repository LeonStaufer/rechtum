import "package:flutter/material.dart";
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:rechtum/app.dart';
import 'package:rechtum/services/authentication.dart';
import 'package:rechtum/services/debug_logger.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/view_models/chat_view_model.dart';
import 'package:rechtum/views/chat_page.dart';
import 'package:rechtum/views/home_page.dart';

void main() {
  const openAiKey = String.fromEnvironment("openAiKey");
  setupDependencyInjection(
    DebugLogger(),
    GPT3(openAiKey),
    AuthenticationService(),
  );

  runApp(App());
}

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

    return MaterialApp(
      title: "RechTUM",
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/chat": (BuildContext context) =>
            ChangeNotifierProvider<ChatViewModel>(
              create: (context) => ChatViewModel(),
              child: ChatPage(),
            ),
      },
    );
  }
}

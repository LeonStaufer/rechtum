import "package:flutter/material.dart";
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:provider/provider.dart';
import 'package:rechtum/services/debug_logger.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/utils/color.dart';
import 'package:rechtum/view_models/chat_view_model.dart';
import 'package:rechtum/views/chat_page.dart';
import 'package:rechtum/views/home_page.dart';

void main() {
  const openAiKey = String.fromEnvironment("openAiKey");
  setupDependencyInjection(DebugLogger(), GPT3(openAiKey));

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: createMaterialColor(Color(0xff0065bd)),
      textTheme: Typography.material2018().black,
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

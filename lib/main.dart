import "package:flutter/material.dart";
import 'package:rechtum/utils/color.dart';
import 'package:rechtum/views/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: createMaterialColor(Color(0xff0065bd)),
    );

    return MaterialApp(
      title: "RechTUM",
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
    );
  }
}

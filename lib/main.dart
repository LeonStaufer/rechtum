import "package:flutter/material.dart";
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:rechtum/app.dart';
import 'package:rechtum/services/authentication.dart';
import 'package:rechtum/services/debug_logger.dart';
import 'package:rechtum/services/locator.dart';

void main() {
  const openAiKey = String.fromEnvironment("openAiKey");
  setupDependencyInjection(
    DebugLogger(),
    GPT3(openAiKey),
    AuthenticationService(),
  );

  runApp(App());
}

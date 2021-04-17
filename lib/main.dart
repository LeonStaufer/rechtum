import "package:flutter/material.dart";
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:provider/provider.dart';
import 'package:rechtum/app.dart';
import 'package:rechtum/services/authentication.dart';
import 'package:rechtum/services/debug_logger.dart';
import 'package:rechtum/services/document.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/view_models/auth_view_model.dart';
import 'package:rechtum/view_models/chat_view_model.dart';

void main() {
  const openAiKey = String.fromEnvironment("openAiKey");
  setupDependencyInjection(
    DebugLogger(),
    GPT3(openAiKey),
    AuthenticationService(),
    DocumentService(),
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
    ChangeNotifierProvider<ChatViewModel>(create: (_) => ChatViewModel()),
  ], child: App()));
}

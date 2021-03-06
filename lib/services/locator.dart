import 'package:get_it/get_it.dart';
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:rechtum/services/authentication.dart';
import 'package:rechtum/services/document.dart';
import 'package:rechtum/services/logger.dart';

/// GetIt singleton to locate injected dependencies
final GetIt locator = GetIt.instance;

/// register all services with [locator]
void setupDependencyInjection(Logger logger, GPT3 gpt3,
    AuthenticationService authService, DocumentService documentService) {
  locator.registerSingleton(logger);
  locator.registerSingleton(gpt3);
  locator.registerSingleton(authService);
  locator.registerSingleton(documentService);
}

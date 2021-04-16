import 'package:rechtum/services/logger.dart';

/// implementation of [Logger] using [debugPrint]
class DebugLogger implements Logger {
  /// print a debug [msg] with optional [param]
  @override
  void debug(String msg, {dynamic param}) {
    print("ℹ️ | ${DateTime.now()} | $msg"
        "${param != null ? "\n\t" : ""}${param ?? ""}");
  }

  /// print an error [msg] with optional [param], [error], and [exception]
  @override
  void error(String msg, {dynamic param, Error? error, Exception? exception}) {
    print("⛔ | ${DateTime.now()} | $msg"
        "${param != null ? "\n\t" : ""}${param ?? ""}"
        "${error != null ? "\n\t" : ""}${error?.stackTrace ?? ""}"
        "${exception != null ? "\n\t" : ""}${exception?.toString() ?? ""}");
  }

  /// print an info [msg] with optional [param]
  @override
  void info(String msg, {dynamic param}) {
    print("💡 | ${DateTime.now()} | $msg"
        "${param != null ? "\n\t" : ""}${param ?? ""}");
  }

  /// print a warning [msg] with optional [param]
  @override
  void warn(String msg, {dynamic param}) {
    print("⚠️ | ${DateTime.now()} | $msg"
        "${param != null ? "\n\t" : ""}${param ?? ""}");
  }
}

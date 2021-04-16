/// interface for Logger
abstract class Logger {
  /// print a debug [msg] with optional [param]
  void debug(String msg, {dynamic param});

  /// print an info [msg] with optional [param]
  void info(String msg, {dynamic param});

  /// print a warning [msg] with optional [param]
  void warn(String msg, {dynamic param});

  /// print an error [msg] with optional [param], [error], and [exception]
  void error(String msg, {dynamic param, Error error, Exception exception});
}

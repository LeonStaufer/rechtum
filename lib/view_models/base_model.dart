import 'package:flutter/widgets.dart';

/// base model for state management with [Provider]
class BaseModel extends ChangeNotifier {
  Status _status = Status.IDLE;

  /// current exception of the model, is null unless the status is [Status.ERROR]
  Exception? exception;

  /// current status of the model
  Status get status => _status;

  /// set the status of the model to [status] and notify listeners
  void setStatus(Status status) {
    _status = status;
    notifyListeners();
  }
}

/// state of the model
enum Status {
  /// model is not doing anything
  IDLE,

  /// model is currently working
  BUSY,

  /// model has encountered an error
  ERROR
}
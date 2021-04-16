import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:rechtum/view_models/base_model.dart';
import 'package:rechtum/models/message.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/services/logger.dart';

/// view model for home screen
class ChatViewModel extends BaseModel {
  /// list of messages that should be displayed
  List<Message> get messages => _messages;

  final Logger _logger = locator.get<Logger>();
  final GPT3 _gpt3 = locator.get<GPT3>();
  List<Message> _messages = <Message>[];

  void sendMessage(String text) {
    text = text.trim();
    if (text.isEmpty) return;

    _messages.add(Message(text: text, author: "User"));
    setStatus(Status.IDLE);

  }
}

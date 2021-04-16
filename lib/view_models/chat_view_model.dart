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

  static const prompt = """
  The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly.Human: Hello, who are you?\nAI: I am an AI created by OpenAI. How can I help you today?\n
  """;

  void sendMessage(String text) async {
    text = text.trim();
    if (text.isEmpty) return;

    _messages.add(Message(text: text, author: "User"));
    setStatus(Status.IDLE);

    var answer =
        await _gpt3.completion(prompt + "Human:$text\nAI:", stop: "\n");

    _logger.info(answer.choices.map((e) => e.text).join(","));

    _messages.add(Message(text: answer.choices[0].text, author: "GPT3"));
    setStatus(Status.IDLE);
  }
}

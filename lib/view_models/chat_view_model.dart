import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:rechtum/services/authentication.dart';
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
  final AuthenticationService _authService =
      locator.get<AuthenticationService>();
  List<Message> _messages = <Message>[];

  static const prompt = """
  The following is a conversation with a legal advisor who is an expert in German law and especially in university law. The advisor is helpful, creative clever, and very exact.\n\nHuman: Hello, who are you?\nAI: I am a legal advisor AI specialized in German law. How can I help you today?\n
  """;

  void sendMessage(String text) async {
    text = text.trim();
    if (text.isEmpty) return;

    _messages.add(Message(text: text, author: _authService.current.username));
    setStatus(Status.IDLE);

    var answer =
        await _gpt3.completion(prompt + "Human:$text\nAI:",
          maxTokens: 150,
          temperature: 0.25, // deterministic, repetitive --> random
          topP: 1,
          frequencyPenalty: 0.5, // the higher the less likely the model repeats itself
          presencePenalty: 0.5, // the higher the higher the likelihood that the model introduces new topics
          bestOf: 1,
          engine: Engine.davinci,
          stop: "\n"
        );

    _logger.info(answer.choices.map((e) => e.text).join(","));

    _messages.add(Message(text: answer.choices[0].text, author: "GPT3"));
    setStatus(Status.IDLE);
  }
}

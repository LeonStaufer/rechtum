import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rechtum/view_models/chat_view_model.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatViewModel viewModel = context.watch<ChatViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Chat with RechTUM...")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.all(16),
              children: viewModel.messages.reversed
                  .map((message) => Chip(label: Text(message.text)))
                  .toList(),
            ),
          ),
          SendRow(),
        ],
      ),
    );
  }
}

class SendRow extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ChatViewModel viewModel = context.watch<ChatViewModel>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.send),
              hintText: "What do you need help with?",
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).accentColor, width: 8),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onSubmitted: (text) {
              viewModel.sendMessage(text);
              controller.clear();
            },
          )),
        ],
      ),
    );
  }
}
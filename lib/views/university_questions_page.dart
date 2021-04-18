import 'package:flutter/material.dart';
import 'package:rechtum/view_models/qa_question_view_model.dart';
import 'package:rechtum/views/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class UniversityQuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QAViewModel viewModel = context.watch<QAViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: FrostedGlassAppBar(title: "University Questions"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.vRouter.push("/chat"),
        child: Text("?", style: TextStyle(fontSize: 28)),
      ),
      body: Column(
        children: [
          SizedBox(height: 106),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.all(8),
                  expansionCallback: (int index, bool isExpanded) {
                    viewModel.toggle(index);
                  },
                  children: viewModel.items.map(toExpansionPanel).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ExpansionPanel toExpansionPanel(item) => ExpansionPanel(
        headerBuilder: (context, __) => Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            item.question,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(item.answer),
        ),
        isExpanded: item.isExpanded,
      );
}

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:provider/provider.dart';
import 'package:rechtum/models/document.dart';
import 'package:rechtum/view_models/document_overview_view_model.dart';
import 'package:rechtum/views/widgets.dart';
import 'package:vrouter/vrouter.dart';

class DocumentOverviewPage extends StatelessWidget {
  final PdfController pdfController =
      PdfController(document: PdfDocument.openAsset("assets/fpso_bwl.pdf"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: FrostedGlassAppBar(title: "Document Overview"),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          SizedBox(height: 96),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
                "Here you will find an overview of all the official legal documents for your course."),
          ),
          Divider(thickness: 2, height: 16),
        ]..addAll(context
            .read<DocumentOverviewViewModel>()
            .getDocuments()
            .map((e) => DocumentCard(e))
            .toList()),
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  DocumentCard(this.document)
      : controller =
            PdfController(document: PdfDocument.openAsset(document.filePath));

  final Document document;
  final PdfController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Icon(Icons.book),
          title: Text(document.title),
          onTap: () => context.vRouter.push("document/${document.id}")),
    );
  }
}

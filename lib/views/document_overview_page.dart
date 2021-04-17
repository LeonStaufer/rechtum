import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:rechtum/models/document.dart';
import 'package:rechtum/view_models/document_overview_view_model.dart';
import 'package:vrouter/vrouter.dart';
import 'package:provider/provider.dart';

class DocumentOverviewPage extends StatelessWidget {
  final PdfController pdfController =
      PdfController(document: PdfDocument.openAsset("assets/fpso_bwl.pdf"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              title: Text(
                "Document Overview",
                style: TextStyle(color: Colors.black87),
              ),
              leading: BackButton(
                onPressed: () => context.vRouter.pop(),
                color: Colors.black87,
              ),
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
              shadowColor: Colors.transparent,
            ),
          ),
        ),
        preferredSize: Size(
          double.infinity,
          56,
        ),
      ),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(document.title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: PdfView(
                controller: controller,
                documentLoader: Center(child: CircularProgressIndicator()),
                pageLoader: Center(child: CircularProgressIndicator()),
              ),
            ),
            OutlinedButton(
                onPressed: () =>
                    context.vRouter.push("document/${document.id}"),
                child: Text("Read more")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:rechtum/models/document.dart';
import 'package:rechtum/services/document.dart';
import 'package:rechtum/services/locator.dart';
import 'package:vrouter/vrouter.dart';

class DocumentPageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? id = context.vRouter.pathParameters["id"];
    if (id == null) return Container();

    Document? document = locator.get<DocumentService>().getDocument(id);
    if (document == null) return Container();

    return DocumentPage(document.title, document.filePath);
  }
}

class DocumentPage extends StatefulWidget {
  DocumentPage(this.title, this.filePath);

  final String title;
  final String filePath;

  @override
  _DocumentPageState createState() => _DocumentPageState(filePath);
}

class _DocumentPageState extends State<DocumentPage> {
  _DocumentPageState(filePath)
      : _pdfController = PdfController(
          document: PdfDocument.openAsset(filePath),
        );

  int _actualPageNumber = 0, _allPagesCount = 0;
  PdfController _pdfController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: Duration(milliseconds: 100),
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '$_actualPageNumber/$_allPagesCount',
              style: TextStyle(fontSize: 22),
            ),
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: Duration(milliseconds: 100),
              );
            },
          )
        ],
      ),
      body: PdfView(
        documentLoader: Center(child: CircularProgressIndicator()),
        pageLoader: Center(child: CircularProgressIndicator()),
        controller: _pdfController,
        onDocumentLoaded: (document) {
          setState(() {
            _allPagesCount = document.pagesCount;
          });
        },
        onPageChanged: (page) {
          setState(() {
            _actualPageNumber = page;
          });
        },
      ),
    );
  }
}
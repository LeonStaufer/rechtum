import 'package:rechtum/models/document.dart';

class DocumentService {
  final List<Document> _documents = [
    Document(
        id: "0",
        title: "Your Academic and Examination Regulation",
        filePath: "assets/fpso_bwl.pdf"),
    Document(
        id: "1",
        title: "Addition to your Academic and Examination Regulations",
        filePath: "assets/ae_fpso_bwl.pdf"),
  ];

  List<Document> getDocuments() => _documents;

  Document? getDocument(String id) {
    return _documents.where((Document e) => e.id == id).first;
  }
}

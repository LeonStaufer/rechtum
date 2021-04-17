import 'package:rechtum/models/document.dart';

class DocumentService {
  static final List<Document> _uniDocuments = [
    Document(
      id: "aspo",
      title: "General Academic and Examination Regulations",
      filePath: "assets/aspo.pdf",
    ),
    Document(
        id: "0",
        title: "Academic and Examination Regulation",
        filePath: "assets/fpso_bwl.pdf"),
    Document(
        id: "1",
        title: "Addition to Academic and Examination Regulations",
        filePath: "assets/ae_fpso_bwl.pdf"),
    Document(
      id: "immats",
      title:
          "Enrollment, Re-enrollment, Leave of Absence and Withdrawal Statutes",
      filePath: "assets/immats.pdf",
    ),
  ];

  static final List<Document> _germanyDocuments = [
    Document(
        id: "gg", title: "Basic Law (Grundgesetz)", filePath: "assets/gg.pdf"),
    Document(
      id: "bgb_en",
      title: "BGB - English Translation",
      filePath: "assets/BGB_English.pdf",
    ),
  ];

  final List<Document> _documents = []..addAll(_uniDocuments)..addAll(_germanyDocuments);

  List<Document> getUniDocuments() => _uniDocuments;

  List<Document> getGermanyDocuments() => _germanyDocuments;

  Document? getDocument(String id) {
    return _documents.where((Document e) => e.id == id).first;
  }
}

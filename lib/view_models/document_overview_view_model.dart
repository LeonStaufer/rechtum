import 'package:rechtum/models/document.dart';
import 'package:rechtum/services/document.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/view_models/base_model.dart';

class DocumentOverviewViewModel extends BaseModel {
  final DocumentService _documentService = locator.get<DocumentService>();

  List<Document> getUniDocuments() => _documentService.getUniDocuments();

  List<Document> getGermanyDocuments() =>
      _documentService.getGermanyDocuments();
}

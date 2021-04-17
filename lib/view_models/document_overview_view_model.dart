import 'package:rechtum/models/document.dart';
import 'package:rechtum/services/document.dart';
import 'package:rechtum/services/locator.dart';
import 'package:rechtum/view_models/base_model.dart';

class DocumentOverviewViewModel extends BaseModel {
  List<Document> getDocuments() {
    return locator.get<DocumentService>().getDocuments();
  }
}

import 'package:coding_developer_driver_app/features/auth/domain/entities/document_entity.dart';

abstract class DocumentRepo {
  Future<void> uploadDocument(List<DocumentEntity> document);
}

import 'package:coding_developer_driver_app/features/auth/domain/entities/document_entity.dart';
import 'package:coding_developer_driver_app/features/auth/domain/repositories/Document_repo.dart';

class UploadDocumentUsecase {
  final DocumentRepo repo;

  UploadDocumentUsecase({required this.repo});

  Future<void> call(List<DocumentEntity> document) async {
    await repo.uploadDocument(document);
  }
}

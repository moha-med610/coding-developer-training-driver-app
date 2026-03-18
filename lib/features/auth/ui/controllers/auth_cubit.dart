import 'package:bloc/bloc.dart';
import 'package:coding_developer_driver_app/core/constants/document_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../widgets/select_source_widget.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  final ImagePicker _picker = ImagePicker();

  Future<ImageSource?> _pickSource(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectSourceWidget(
              leading: Icon(Icons.camera_alt_rounded),
              title: "Camera",
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            SizedBox(height: 20),
            SelectSourceWidget(
              leading: Icon(Icons.photo),
              title: "Gallery",
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        );
      },
    );
  }

  Future<void> pickDocument(BuildContext context, String type) async {
    final source = await _pickSource(context);
    if (source == null) return;

    emit(state.copyWith(loading: true));

    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 90,
    );

    if (file == null) {
      emit(state.copyWith(loading: false));
      return;
    }

    switch (type) {
      case DocumentType.idFront:
        emit(state.copyWith(loading: false, idFront: file));
        break;

      case DocumentType.idBack:
        emit(state.copyWith(loading: false, idBack: file));
        break;

      case DocumentType.driverLicence:
        emit(state.copyWith(loading: false, driverLicence: file));
        break;
    }
  }
}

import 'dart:io';

import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/features/auth/ui/controllers/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key, this.file});

  final XFile? file;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) {
        return previous.loading != current.loading;
      },
      builder: (context, state) {
        if (file == null) {
          return const SizedBox.shrink();
        }

        if (state.loading) {
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: 40,
              ),
            ),
          );
        }

        return ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(14),
          child: Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            child: Image.file(File(file!.path), height: 200, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}

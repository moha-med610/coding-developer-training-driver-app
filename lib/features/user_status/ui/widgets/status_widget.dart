import 'package:coding_developer_driver_app/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.path,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onTap,
    required this.titleStyle,
    required this.descriptionStyle,
  });

  final String path;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onTap;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          LottieBuilder.asset(path),
          Spacer(),
          Text(title, style: titleStyle),
          SizedBox(height: 10),
          Text(
            description,
            style: descriptionStyle,
            textAlign: TextAlign.center,
          ),
          Spacer(),
          CustomButtonWidget(onTap: onTap, label: buttonLabel),
        ],
      ),
    );
  }
}

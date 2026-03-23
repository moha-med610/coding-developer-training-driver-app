import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Lottie.asset(path),
    );
  }
}

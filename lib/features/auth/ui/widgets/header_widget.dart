import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        title,
        style: Theme.of(context).primaryTextTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}

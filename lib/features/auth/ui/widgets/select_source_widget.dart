import 'package:flutter/material.dart';

class SelectSourceWidget extends StatelessWidget {
  const SelectSourceWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
  });

  final Widget leading;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
        onTap: onTap,
      ),
    );
  }
}

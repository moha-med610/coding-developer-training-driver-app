import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocumentWidget extends StatelessWidget {
  const DocumentWidget({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFF5F9FE),
          borderRadius: BorderRadius.circular(14),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).primaryTextTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            Icon(CupertinoIcons.arrow_up_circle_fill, size: 30),
          ],
        ),
      ),
    );
  }
}

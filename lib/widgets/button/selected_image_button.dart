import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme/color.dart';

class SelectedImageButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onClosePressed;

  const SelectedImageButton({
    super.key,
    required this.imageUrl,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(imageUrl),
              fit: BoxFit.fitHeight,
              errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) =>
                  const Center(child: Text('This image type is not supported')),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: InkWell(
            onTap: onClosePressed,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColor.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

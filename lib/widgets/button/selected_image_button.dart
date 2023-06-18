import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme/color.dart';

class SelectedImageButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onClosePressed;
  final bool isEdition;

  const SelectedImageButton({
    super.key,
    required this.imageUrl,
    required this.onClosePressed,
    required this.isEdition,
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
            child: isEdition
                ? Image.network(imageUrl, fit: BoxFit.fill)
                : Image.file(
                    File(imageUrl),
                    fit: BoxFit.fill,
                    errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) =>
                        const Center(
                            child: Text('This image type is not supported')),
                  ),
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: InkWell(
            onTap: () {
              if (isEdition) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Não é possível editar imagens de um anúncio criado',
                    ),
                  ),
                );
              } else {
                onClosePressed();
              }
            },
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

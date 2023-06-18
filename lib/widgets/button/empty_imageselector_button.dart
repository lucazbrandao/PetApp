import 'package:flutter/material.dart';

class EmptyImagesSelectedContainer extends StatelessWidget {
  final VoidCallback onTap;
  final bool isEdition;

  const EmptyImagesSelectedContainer({
    super.key,
    required this.onTap,
    required this.isEdition,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isEdition ? null : onTap();
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              color: Colors.grey[400],
              size: 100,
            ),
            Text(
              isEdition ? 'Não é possível editar imagens' : 'Adicionar Imagens',
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:petapp/theme/color.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String petName;
  final Function onConfirm;

  const DeleteConfirmationDialog(
      {super.key, required this.petName, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Excluir item'),
      content: Text('Deseja excluir o anuncio do pet $petName?'),
      actions: [
        TextButton(
          child: Text(
            'Cancelar',
            style: TextStyle(
              color: AppColor.secondary,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Ok',
            style: TextStyle(
              color: AppColor.secondary,
            ),
          ),
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

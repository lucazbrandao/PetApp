import 'package:flutter/material.dart';

import '../../theme/color.dart';

class PetButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  PetButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  final shape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));

  final color = MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) => states.contains(MaterialState.disabled)
        ? AppColor.primary
        : AppColor.secondary,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: TextButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          backgroundColor: color,
          shape: MaterialStateProperty.all(shape),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

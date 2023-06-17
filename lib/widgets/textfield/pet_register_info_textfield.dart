import 'package:flutter/material.dart';
import 'package:petapp/theme/sizes.dart';

import '../../theme/color.dart';

class PetRegisterInfoTextfield extends StatelessWidget {
  final String label;
  final String hint;
  final bool isBioField;

  const PetRegisterInfoTextfield({
    super.key,
    required this.label,
    required this.hint,
    this.isBioField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        sizedBox5,
        TextFormField(
          cursorColor: AppColor.secondary,
          decoration: InputDecoration(
            focusColor: Colors.pink,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondary),
            ),
            border: OutlineInputBorder(),
            hintText: hint,
          ),
          maxLines: isBioField ? 3 : 1,
        ),
      ],
    );
  }
}

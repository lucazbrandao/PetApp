import 'package:flutter/material.dart';

import '../../theme/color.dart';

class RegisterPetTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;

  const RegisterPetTextField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        floatingLabelStyle: TextStyle(color: AppColor.secondary),
        filled: true,
        fillColor: Colors.grey[200],
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.secondary),
        ),
      ),
      cursorColor: AppColor.secondary,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, digite o nome';
        }
        return null;
      },
    );
  }
}

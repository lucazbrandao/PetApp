import 'package:flutter/material.dart';

import '../../theme/color.dart';

class PetTextField extends StatelessWidget {

  final TextEditingController controller;
  final IconData icon;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String hintText;
  final bool isPassword;

  const PetTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.inputType,
    required this.hintText,
    required this.isPassword,
    required this.inputAction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextSelectionTheme(
        data: TextSelectionThemeData(
          cursorColor: AppColor.primary,
          selectionHandleColor: AppColor.primary,
          selectionColor: AppColor.primary.withOpacity(0.8),
        ),
        child: TextField(
          controller: controller,
          keyboardType: inputType,
          textInputAction: inputAction,
          style: const TextStyle(
            color: Colors.grey,
          ),
          obscureText: isPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              icon,
              color: AppColor.primary,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
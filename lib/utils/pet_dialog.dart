import 'package:flutter/material.dart';
import 'package:petapp/theme/color.dart';

void showPetDialog(BuildContext context, String dialogTitle, Widget content) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        dialogTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.secondary, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: content,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
    ),
  );
}
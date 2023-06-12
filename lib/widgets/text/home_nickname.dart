import 'package:flutter/material.dart';

class HomeNickName extends StatelessWidget {
  final String name;

  const HomeNickName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Oi, ',
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }
}

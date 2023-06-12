import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/sizes.dart';

class NavigationItem extends StatelessWidget {

  final String icon;
  final String text;
  final Color color;

  const NavigationItem({Key? key, required this.icon, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/$icon',
          height: 25,
          color: color,
        ),
        // Icon(icon, color: color,),
        sizedBox5,
        Text(text, style: TextStyle(color: color, fontSize: 10))
      ],
    );
  }
}
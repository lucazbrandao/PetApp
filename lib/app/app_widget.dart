import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../theme/color.dart';

class PetApp extends StatelessWidget {
  const PetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}

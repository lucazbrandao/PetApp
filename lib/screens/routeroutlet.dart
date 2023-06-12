import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/navigationbar/pet_navbar.dart';

class RouterOutletScreen extends StatelessWidget {
  const RouterOutletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: PetBottomNavBar(),
    );
  }
}
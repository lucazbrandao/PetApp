import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/controllers/bottom_navbar_controller.dart';
import 'package:petapp/controllers/home_controller.dart';
import 'package:petapp/screens/home_screen.dart';
import 'package:petapp/screens/login_screen.dart';
import 'package:petapp/screens/pet_details_screen.dart';
import 'package:petapp/screens/register_screen.dart';

import '../screens/routeroutlet.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => BottomNavigationBarController()),
        Bind.singleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
        ChildRoute('/register', child: (context, args) => RegisterPage()),
        ChildRoute(
          '/pethome',
          child: (context, args) => const RouterOutletScreen(),
          children: [
            ChildRoute('/', child: (_, __) => HomeScreen()),
          ],
        ),
        ChildRoute('/petdetails/:advId',
            child: (_, args) => PetDetailsScreen(advId: args.params['advId'])),
      ];
}

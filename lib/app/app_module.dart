import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/screens/login_screen.dart';
import 'package:petapp/screens/register_screen.dart';

import '../controllers/bottom_navbar_controller.dart';
import '../controllers/home_controller.dart';
import '../screens/home_screen.dart';
import '../screens/pet_adoption_screen.dart';
import '../screens/pet_details_screen.dart';
import '../screens/routeroutlet.dart';
import '../screens/settings_screen.dart';

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
          '/pet',
          child: (context, args) => const RouterOutletScreen(),
          children: [
            ChildRoute('/home', child: (_, __) => HomeScreen()),
            ChildRoute('/adoption', child: (_, __) => PetAdoptionScreen()),
            ChildRoute('/settings', child: (_, __) => SettingsScreen()),
          ],
        ),
        ChildRoute(
          '/petdetails/:advId',
          child: (_, args) => PetDetailsScreen(advId: args.params['advId']),
        ),
      ];
}

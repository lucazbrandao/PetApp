import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/controllers.dart';
import '../screens/screens.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(BottomNavigationBarController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginScreen());
    r.child('/register', child: (context) => RegisterScreen());
    r.child(
      '/pet',
      child: (context) => const RouterOutletScreen(),
      children: [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        ModuleRoute('/adoption', module: AdoptionModule()),
        ModuleRoute('/settings', module: SettingsModule()),
      ],
    );
  }
}

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add(HomeController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => HomeScreen());
  }
}

class AdoptionModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => PetAdoptionScreen());
    r.child(
      '/petdetails/:advId',
      child: (context) => PetDetailsScreen(advId: r.args.params['advId']),
    );
  }
}

class SettingsModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => SettingsScreen());
  }
}

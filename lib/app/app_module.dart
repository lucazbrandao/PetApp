import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/screens/login_screen.dart';
import 'package:petapp/screens/pet_details_screen.dart';
import 'package:petapp/screens/register_screen.dart';

import 'pet_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
        ChildRoute('/register', child: (context, args) => RegisterPage()),
        ChildRoute(
          '/petdetails/:advId',
          child: (_, args) => PetDetailsScreen(advId: args.params['advId']),
        ),
        ModuleRoute('/petmodule', module: PetModule()),
      ];
}

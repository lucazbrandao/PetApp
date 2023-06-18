import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class BottomNavigationBarController {
  final BehaviorSubject<int> _navigationController =
      BehaviorSubject<int>.seeded(0);

  Stream<int> get getNavigationController => _navigationController.stream;

  void setPage(int page) {
    _navigationController.sink.add(page);

    switch (page) {
      case 0:
        Modular.to.navigate('/pethome/');
        break;
      case 1:
        Modular.to.navigate('/pethome/adoption');
        break;
      case 2:
        Modular.to.navigate('/pethome/settings');
        break;
      default:
        Modular.to.navigate('/pethome/');
    }
  }

  void dispose() {
    _navigationController.sink.add(0);
    // _navigationController.close();
  }
}

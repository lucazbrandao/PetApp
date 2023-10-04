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
        Modular.to.navigate('/pet/home');
        break;
      case 1:
        Modular.to.navigate('/pet/adoption');
        break;
      case 2:
        Modular.to.navigate('/pet/settings');
        break;
      default:
        Modular.to.navigate('/pet/home');
    }
  }

  void dispose() {
    _navigationController.close();
  }
}

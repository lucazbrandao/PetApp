import 'package:rxdart/rxdart.dart';

class BottomNavigationBarController {

  final BehaviorSubject<int> _navigationController = BehaviorSubject<int>.seeded(0);

  Stream<int> get getNavigationController => _navigationController.stream;

  void setPage(int page) {
    _navigationController.sink.add(page);

    switch (page) {
      case 0:
        // Modular.to.navigate('/dashboard/menu');
        break;
      case 1:
        // Modular.to.navigate('/dashboard/home');
        break;
      default:
        // Modular.to.navigate('/dashboard/settings');
    }
  }

  void dispose() {
    _navigationController.close();
  }
}
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class Home = HomeBase with _$Home;

abstract class HomeBase with Store {
  @observable
  int indexPage = 1;

  @action
  void changePage(int index) => indexPage == index ? null : indexPage = index;
}

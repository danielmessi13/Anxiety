import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeBase with _$HomeStore;

abstract class _HomeBase with Store {
  @observable
  int indexPage = 2;

  @action
  void changePage(int index) => indexPage == index ? null : indexPage = index;
}

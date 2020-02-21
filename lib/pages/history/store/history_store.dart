import 'package:flutter_anxiety/models/history.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryBase with _$HistoryStore;

abstract class _HistoryBase with Store {
  final HasuraConnect _connection;

  @observable
  List<History> historyList = ObservableList.of([]);

  _HistoryBase(this._connection);

  @action
  set(List<History> value) => historyList = value;

  @action
  void addHistory(History historyModel) => historyList.add(historyModel);

  @action
  Future<void> getMyHistory() async {
    String docQuery = """
      query {
        history(order_by: {date: desc}) {
          id
          pulse
          date
          tag {
            id
            title
          }
        }
      }
    """;
    var snapshot = _connection.subscription(docQuery);
    snapshot.listen((data) {
      List histories = data['data']['history'];
      historyList = ObservableList.of(
        histories.map((value) => History.fromHasura(value)).toList(),
      );
    }).onError((err) {
      print(err);
    });
  }
}

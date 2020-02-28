import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'history_store.dart';

class HistoryPage extends StatelessWidget {
  final HistoryStore historyStore;

  HistoryPage(this.historyStore);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    historyStore.getMyHistory();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Meu historico",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: MediaQuery.of(context).size.width * 0.3,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return historyStore.historyList.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: historyStore.historyList.length,
                        itemBuilder: (_, index) {
                          return Card(
                            child: ListTile(
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.favorite, color: Colors.red),
                                  Text(
                                    '${historyStore.historyList[index].pulse}',
                                  )
                                ],
                              ),
                              title: Row(
                                children: <Widget>[
                                  Icon(Icons.local_offer),
                                  SizedBox(width: 4),
                                  Text(historyStore
                                      .historyList[index].tag.title),
                                ],
                              ),
                              subtitle: Text(
                                DateFormat.yMMMMd('pt_BR').add_Hm().format(
                                      historyStore.historyList[index].date,
                                    ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'Nenhuma medição encontrada.',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}

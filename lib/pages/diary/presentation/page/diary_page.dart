import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_anxiety/pages/diary/store/diary_store.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DiaryPage extends StatelessWidget {
  final DiaryStore diaryController;

  DiaryPage(this.diaryController);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Meu diário',
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
            child: Observer(builder: (_) {
              return diaryController.listDiary.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: diaryController.listDiary.length,
                      itemBuilder: (_, index) {
                        return Card(
                          child: ListTile(
                            trailing: IconButton(
                              onPressed: () {
                                // TODO apagar diario
                                diaryController.deleteDiary(
                                  diaryController.listDiary[index].id,
                                );
                              },
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.redAccent,
                              ),
                            ),
                            onTap: () {},
                            leading: Icon(Icons.book),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  diaryController.listDiary[index].title,
                                ),
                                Text(
                                  DateFormat.yMd('pt_BR').add_Hm().format(
                                        diaryController.listDiary[index].date,
                                      ),
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 8)
                              ],
                            ),
                            subtitle: Text(
                              diaryController.listDiary[index].description,
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Nenhuma diario encontrado.',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_anxiety/diary/store/diary_store.dart';

class DiaryPage extends StatelessWidget {
  final Diary diaryController;

  DiaryPage(this.diaryController);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Observer(
        builder: (_) {
          return diaryController.listDiary.length > 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Meu diário",
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: diaryController.listDiary.length,
                        itemBuilder: (_, index) {
                          return Card(
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () => diaryController.deleteDiary(
                                    diaryController.listDiary[index]),
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.redAccent,
                                ),
                              ),
                              onTap: () {},
                              leading: Icon(Icons.book),
                              title: Text(
                                diaryController.listDiary[index].title,
                              ),
                              subtitle: Text(
                                diaryController.listDiary[index].description,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Container(child: Text("Não tem nenhum diario"));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_anxiety/diary/store/diary_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final diaryController = Diary();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 50),
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: diaryController.listDiary.length,
                      itemBuilder: (_, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {},
                            leading: Icon(Icons.book),
                            title: Text(
                              diaryController.listDiary[index].title,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : Container(child: Text("Não tem nenhum diariou"));
        },
      ),
    );
  }
}

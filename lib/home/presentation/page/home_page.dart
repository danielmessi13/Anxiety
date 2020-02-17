import 'package:flutter/material.dart';
import 'package:flutter_anxiety/diary/presentation/page/diary_page.dart';
import 'package:flutter_anxiety/diary/store/diary_store.dart';
import 'package:flutter_anxiety/diary/widget/new_diary_dialog.dart';
import 'package:flutter_anxiety/history/presentation/page/history_page.dart';
import 'package:flutter_anxiety/home/presentation/widget/home_initial.dart';
import 'package:flutter_anxiety/home/store/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatelessWidget {
  final homeController = Home();
  final diaryController = Diary();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    (diaryController.listDiary as ObservableList).observe((ListChange change) {
      if (change.added != null) {
        _scaffoldKey.currentState
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text('Diario Adicionado'),
            backgroundColor: Colors.green,
          ));
      } else if (change.removed != null) {
        _scaffoldKey.currentState
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text('Diario Removido'),
            backgroundColor: Colors.red,
          ));
      }
    });
    return Observer(
      builder: (_) => Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[800],
          items: <BottomNavigationBarItem>[
            buildBottomNavigationBarItem(
              icon: Icons.history,
              size: 30,
              label: "Histórico",
            ),
            buildBottomNavigationBarItem(
              icon: Icons.home,
              size: 30,
              label: "Início",
            ),
            buildBottomNavigationBarItem(
              icon: Icons.book,
              size: 30,
              label: "Diário",
            ),
          ],
          currentIndex: homeController.indexPage,
          onTap: homeController.changePage,
        ),
        body: homeController.indexPage == 0
            ? HistoryPage()
            : homeController.indexPage == 1
                ? HomeInitial()
                : homeController.indexPage == 2
                    ? DiaryPage(diaryController)
                    : Container(),
        floatingActionButton: homeController.indexPage == 2
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => NewDiaryDialog(diaryController),
                  );
                },
                child: Icon(Icons.add),
              )
            : null,
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    @required IconData icon,
    @required String label,
    @required double size,
    Color color = Colors.white,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: color,
        ),
      ),
      activeIcon: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}

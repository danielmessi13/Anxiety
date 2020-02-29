import 'package:flutter/material.dart';
import 'package:flutter_anxiety/initial/initial_page.dart';
import 'package:flutter_anxiety/pages/diary/diary_page.dart';
import 'package:flutter_anxiety/pages/diary/diary_store.dart';
import 'package:flutter_anxiety/pages/diary/widgets/new_diary_dialog.dart';
import 'package:flutter_anxiety/pages/history/history_page.dart';
import 'package:flutter_anxiety/pages/history/history_store.dart';
import 'package:flutter_anxiety/pages/login/auth0_store.dart';
import 'package:flutter_anxiety/pages/login/login_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  HistoryStore historyStore;
  HomeStore homeController;
  DiaryStore diaryController;

  HasuraConnect connection;

  Auth0Store auth0Store;

  @override
  void initState() {
    super.initState();
    auth0Store = Provider.of<Auth0Store>(context, listen: false);
    connection = HasuraConnect(
      'https://graphql-anxiety.herokuapp.com/v1/graphql',
      token: (_) async => 'Bearer ${auth0Store.client.credentials.idToken}',
    );
    historyStore = HistoryStore(connection);
    homeController = HomeStore();
    diaryController = DiaryStore(connection);
    when(
      (_) => auth0Store.client == null,
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    diaryController.dispose();
  }

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                auth0Store.logout();
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
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
            ? HistoryPage(historyStore)
            : homeController.indexPage == 1
                ? InitalPage()
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

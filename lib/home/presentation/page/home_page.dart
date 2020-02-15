import 'package:flutter/material.dart';
import 'package:flutter_anxiety/diary/presentation/page/diary_page.dart';
import 'package:flutter_anxiety/history/presentation/page/history_page.dart';
import 'package:flutter_anxiety/home/presentation/widget/home_initial.dart';
import 'package:flutter_anxiety/home/store/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final homeController = Home();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
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
                : homeController.indexPage == 2 ? DiaryPage() : Container(),
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

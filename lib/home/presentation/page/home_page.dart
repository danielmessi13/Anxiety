import 'package:flutter/material.dart';
import 'package:flutter_anxiety/home/store/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _AMyHomePageState createState() => _AMyHomePageState();
}

class _AMyHomePageState extends State<HomePage> {
  final homeController = Home();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final fontSize = MediaQuery.of(context).size.width * 0.06;
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
        body: Center(
          child: Container(
            width: width,
            height: width,
            child: FloatingActionButton(
              onPressed: () {},
              tooltip: "Clique para iniciar a ajuda",
              splashColor: Colors.transparent,
              backgroundColor: Colors.blueGrey[600],
              child: Text(
                "Iniciar",
                style: TextStyle(fontSize: fontSize, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    @required IconData icon,
    @required String label,
    @required double size,
  }) {
    final color = Colors.white;
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

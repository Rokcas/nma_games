import 'package:flutter/material.dart';
import 'package:nma_games/widgets/game_grid.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabNames = ["Todo 1", "Todo 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${tabNames[_currentIndex]}"),
      ),
      body: GameGrid(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("TODO"),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: Text("${tabNames[0]}".toUpperCase()),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.movie),
            title: Text("${tabNames[1]}".toUpperCase()),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

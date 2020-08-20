import 'package:flutter/material.dart';
import 'package:nma_games/widgets/game_grid.dart';
import 'package:nma_games/widgets/game_timetable.dart';

import '../routes.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabNames = ["Žaidimai", "Planai"];
  final addPages = [Routes.ROUTE_ADD_GAME_PAGE, Routes.ROUTE_ADD_EVENT_PAGE];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${tabNames[_currentIndex]}"),
      ),
      body: _currentIndex == 0 ? GameGrid() : GameTimetable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(
            context,
            addPages[_currentIndex],
          )
      },
        tooltip: 'Add a new game',
        child: _currentIndex == 1 ? Icon(Icons.add_alarm) : Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.casino),
            title: Text("${tabNames[0]}".toUpperCase()),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.date_range),
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

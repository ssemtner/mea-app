import 'package:flutter/material.dart';
import 'package:mea/Settings.dart';
import 'package:mea/kitchen.dart';
import 'package:mea/lights.dart';
import 'package:mea/mea_icons.dart';
import 'doors.dart';
import 'mea_icons.dart';

class MainPage extends StatefulWidget {
  MainPage({this.title});
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextStyle style = TextStyle(fontSize: 24.0);
  int _currentIndex = 0;

  final List<Widget> _children = [
    KitchenTab(),
    LightsTab(),
    DoorsTab(),
    SettingsTab()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.primaryVariant,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            title: Text('Kitchen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('Lights'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MeaIcons.door),
            title: Text('Doors')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

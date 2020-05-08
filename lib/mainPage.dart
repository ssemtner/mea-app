import 'package:flutter/material.dart';
import 'package:mea/kitchen.dart';

class MainPage extends StatefulWidget {
  MainPage({this.title});

  final String title;

  @override
  createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextStyle style = TextStyle(fontSize: 24.0);

  @override
  Widget build(BuildContext context) {
    final _kitchen = SingleChildScrollView(
      child: Center(

      ),
    );

    final _lights = Column(
      children: <Widget>[
        Icon(Icons.lightbulb_outline),
        RaisedButton(
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/landing', (_) => false);},
          child: Text('RESET', style: style.copyWith(color: Theme.of(context).colorScheme.onSecondary))
        )
      ]
    );

    final _doors = Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Column(

        )
      )
    );

    final _settings = Icon(Icons.settings);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Kitchen'),
              Tab(text: 'Lights'),
              Tab(text: 'Doors'),
              Tab(text: 'Settings'),
            ],
          ),
          title: Text('MEA'),
        ),
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: TabBarView(
            children: [
              KitchenTab(),
              _lights,
              _doors,
              _settings,
            ]
          ),
        ),
      )
    );
  }
}

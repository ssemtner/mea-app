import 'package:flutter/material.dart';

import 'dbManager.dart';

class KitchenTab extends StatefulWidget {
  @override
  KitchenTabState createState() => KitchenTabState();
}

class KitchenTabState extends State<KitchenTab> {
  KitchenTabState() {
    updateFromDB();
    _manager.insert((KitchenCard(id: 2, name: 'aksdjf', temp: 100,).toMap()));
  }

  var _kitchenCards = <KitchenCard>[];
  final _manager = DBManager.instance;

  void updateFromDB() async {
    _manager.insert(KitchenCard(id: 1, name: 'gjghj', temp: 99,).toMap());
    final maps = await _manager.queryAllRows();

    setState(() {
      _kitchenCards = List.generate(maps.length, (i) {
        return KitchenCard(
          id: maps[i]['_id'],
          name: maps[i]['name'],
          temp: maps[i]['temp'],
        );
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            onPressed: updateFromDB,
          ),
          new Flexible(
            child: new ListView.builder(
              itemBuilder: (_, int index) => _kitchenCards[index],
              itemCount: _kitchenCards.length,
            ),
          ),
        ],
      ),
    );
  }
}

class KitchenCard extends StatelessWidget {
  KitchenCard({this.id, this.name, this.status, this.temp});
  final int id;
  final String name;
  final String status;
  final int temp;
  final TextStyle style = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'temp': temp,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5.0,
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: style.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 36.0),
            ),
            Text(
              temp.toString()+"°F",
              style: style.copyWith(color: Theme.of(context).colorScheme.secondaryVariant, fontSize: 64.0),
            ),
          ],
        ),
      ),
    );
  }
}

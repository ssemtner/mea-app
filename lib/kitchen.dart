import 'package:flutter/material.dart';

import 'dbManager.dart';

class KitchenTab extends StatefulWidget {
  @override
  KitchenTabState createState() => KitchenTabState();
}

class KitchenTabState extends State<KitchenTab> {
    KitchenTabState() {
    _updateFromDB();
  }

  var _kitchenCards = <KitchenCard>[];
  final _db = DBManager(
    tableName: 'kitchen',
    c2name: 'name',
    c2type: 'TEXT',
    c3name: 'temp',
    c3type: 'INTEGER'
  );

  void _updateFromDB() async {
    final maps = await _db.queryAllRows();
    _db.insert(KitchenCard(id: 1, name: 'Stove', temp: 700).toMap());
    _db.insert(KitchenCard(id: 2, name: 'Microwave', temp: 49).toMap());
    _db.insert(KitchenCard(id: 3, name: 'Oven', temp: 90).toMap());
    _db.smartAdd(KitchenCard(id: 1, name: 'Stove', temp: 700).toMap());
    setState(() {
      _kitchenCards = List.generate(maps.length, (i) {
        return KitchenCard(
          id: maps[i]['_id'],
          name: maps[i]['name'],
          temp: maps[i]['temp'],
          deleteAction: _removeFromDB,
        );
      });
    });
  }

  Future<bool> _addToDB(KitchenCard card) async {
    await _db.insert(card.toMap());
    _updateFromDB();
    return true;
  }

  Future<bool> _removeFromDB(KitchenCard card) async {
    await _db.delete(card.id);
    _updateFromDB();
    return true;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Flexible(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: ListView.builder(
                itemBuilder: (_, int index) => _kitchenCards[index],
                itemCount: _kitchenCards.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KitchenCard extends StatelessWidget {
  KitchenCard({this.id, this.name, this.temp, this.deleteAction});
  final int id;
  final String name;
  final int temp;
  final ValueChanged<KitchenCard> deleteAction;
  final TextStyle style = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'temp': this.temp,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.1,
        color: Color.fromRGBO(242, 242, 247, 15),
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: style.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 10.0),
              ),
              Text(
                temp.toString()+"°F",
                style: style.copyWith(color: Theme.of(context).colorScheme.secondaryVariant, fontSize: 64.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

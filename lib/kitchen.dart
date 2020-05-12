import 'package:flutter/material.dart';

import 'dbManager.dart';

class KitchenTab extends StatefulWidget {
  @override
  KitchenTabState createState() => KitchenTabState();
}

class KitchenTabState extends State<KitchenTab> {
  KitchenTabState() {
    _updateFromDB();
    _manager.insert((KitchenCard(id: 2, name: 'aksdjf', temp: 100,).toMap()));
  }

  var _kitchenCards = <KitchenCard>[];
  final _manager = DBManager.instance;

  void _updateFromDB() async {
    final maps = await _manager.queryAllRows();

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
    await _manager.insert(card.toMap());
    _updateFromDB();
    return true;
  }

  Future<bool> _removeFromDB(KitchenCard card) async {
    await _manager.delete(card.id);
    _updateFromDB();
    return true;
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
            onPressed: () {
              _addToDB(KitchenCard(id: 1, name: 'thing', temp: 100));
            },
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

class KitchenCard extends StatefulWidget {
  KitchenCard({this.id, this.name, this.status, this.temp, this.deleteAction});
  final int id;
  final String name;
  final String status;
  final int temp;
  final ValueChanged<KitchenCard> deleteAction;

  Map<String, dynamic> toMap() {
    return {
      '_id': this.id,
      'name': this.name,
      'temp': this.temp,
    };
  }

  @override
  _KitchenCardState createState() => _KitchenCardState();
}

class _KitchenCardState extends State<KitchenCard> {
  final TextStyle style = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300);

  var _tapPosition;

  _showPopupMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        _tapPosition & Size(40, 40),
        Offset.zero & overlay.size
      ),
      items: [
        PopupMenuItem(
          child: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {

            }),
        ),
      ],
      elevation: 10.0,
    );
  }

  _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _storePosition,
      onLongPress: () {
        _showPopupMenu(context);
      },
      child: Card(
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
                widget.name,
                style: style.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 36.0),
              ),
              Text(
                widget.temp.toString()+"°F",
                style: style.copyWith(color: Theme.of(context).colorScheme.secondaryVariant, fontSize: 64.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

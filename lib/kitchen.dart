import 'package:flutter/material.dart';

class KitchenTab extends StatefulWidget {
  final _kitchenCards = <KitchenCard>[];

  @override
  KitchenTabState createState() => KitchenTabState();
}

class KitchenTabState extends State<KitchenTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemBuilder: (_, int index) => widget._kitchenCards[index],
              itemCount: widget._kitchenCards.length,
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
      'name': name,
      'status': status,
      'temp': temp,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  name,
                  style: style.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 36.0),
                ),
                Text(
                  status,
                  style: style.copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
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

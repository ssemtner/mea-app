import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({this.title});
  final String title;
  final TextStyle style = TextStyle(fontSize: 24.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.onBackground,
                size: 200,
                semanticLabel: 'Home Icon',
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 200.0,
                height: 60.0,
                child: OutlineButton(
                  onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);},
                  highlightedBorderColor: Theme.of(context).colorScheme.secondaryVariant,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: 3,
                  ),
                  child: Text("Login", style: style),
                ),
              ),
              Container(
                width: 200.0,
                height: 60.0,
                child: OutlineButton(
                  onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/signup', (_) => false);},
                  highlightedBorderColor: Theme.of(context).colorScheme.secondaryVariant,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: 3,
                  ),
                  child: Text("Signup", style: style),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

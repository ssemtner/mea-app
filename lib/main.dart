import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/landing',
      routes: {
        '/': (context) => MainPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => LoginPage(),
        '/landing': (context) => LandingPage(),
      },
      title: 'MEA',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme(
          primary: Colors.deepPurple,
          primaryVariant: Color(0xFF3700B3),
          secondary: Color(0xFFB71C1C),
          secondaryVariant: Colors.red,
          background: Colors.white70,
          surface: Colors.white60,
          error: Color(0xFFB00020),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Colors.white,
          onBackground: Colors.white,
          onSurface: Colors.black87,
          onError: Color(0xFFFFFFFF),
          brightness: Brightness.light,
        ),
      ),
    );
  }
}

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
    final _kitchen = Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new KitchenCard(name: "Oven", status: "Connected", temp: 700),
            ],
          )
        )
      )
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
          padding: EdgeInsets.all(36.0),
          child: TabBarView(
            children: [
              _kitchen,
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

class KitchenCard extends StatelessWidget {
  KitchenCard({this.name, this.status, this.temp});
  final String name;
  final String status;
  final int temp;
  final TextStyle style = TextStyle(fontSize: 24.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5.0,
        color: Theme.of(context).colorScheme.surface,
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
                  style: style.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 48.0),
                ),
                Text(
                  temp.toString()+"°F",
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

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontSize: 20.0);

  Widget _buildInputField(String hint, bool obscure) {
    return TextField(
      style: style.copyWith(color: Theme
        .of(context)
        .colorScheme
        .onSurface),
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
        .of(context)
        .colorScheme
        .background,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100.0),
                Material(
                  elevation: 5.0,
                  color: Theme
                    .of(context)
                    .colorScheme
                    .surface,
                  child: _buildInputField('Email', false),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                SizedBox(height: 25.0),
                Material(
                  elevation: 5.0,
                  color: Theme
                    .of(context)
                    .colorScheme
                    .surface,
                  child: _buildInputField('Password', true),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                SizedBox(height: 35.0),
                Material(
                  elevation: 5.0,
                  color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                  borderRadius: BorderRadius.circular(5.0),
                  child: MaterialButton(
                    minWidth: MediaQuery
                      .of(context)
                      .size
                      .width,
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                    },
                    child: Text('Login', style: style.copyWith(color: Theme
                      .of(context)
                      .colorScheme
                      .onSecondary))
                  ),
                ),
                SizedBox(height: 50.0),
                Material(
                  elevation: 5.0,
                  color: Theme
                    .of(context)
                    .colorScheme
                    .background,
                  child: Container(
                    width: MediaQuery
                      .of(context)
                      .size
                      .width,
                    child: OutlineButton(
                      borderSide: BorderSide(
                        color: Theme
                          .of(context)
                          .colorScheme
                          .surface,
                        width: 1,
                      ),
                      hoverColor: Theme.of(context).colorScheme.secondary,
                      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/signup', (_) => false);
                      },
                      child: Text('Sign Up', style: style.copyWith(color: Theme.of(context).colorScheme.onBackground))
                    ),
                  )
                )
              ],
            ),
          ),
        )
      )
    );
  }
}

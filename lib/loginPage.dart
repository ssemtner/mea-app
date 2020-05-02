  import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontSize: 20.0);

  Widget _buildInputField(BuildContext context, String hint, bool obscure) {
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
                  child: _buildInputField(context, 'Email', false),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                SizedBox(height: 25.0),
                Material(
                  elevation: 5.0,
                  color: Theme
                    .of(context)
                    .colorScheme
                    .surface,
                  child: _buildInputField(context, 'Password', true),
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

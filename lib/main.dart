import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'Log me in!',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPIRA',
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: darkGreen,
        primaryColor: brightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _counter = 0;

  _onClickHandler() {
    setState(() {
      this._counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPIRA"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: TextStyle(
                color: darkGreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Texto 2")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickHandler,
        child: Icon(Icons.add),
      ),
    );
  }
}

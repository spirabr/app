import 'package:flutter/material.dart';
import 'constants.dart';
import 'novaColeta.dart';

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
  Collector selectedCollector;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPIRA - Selecione seu usuário"),
        backgroundColor: brightGreen,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<Collector>(
              value: selectedCollector,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 20,
              style: TextStyle(color: Colors.grey[900], fontSize: 18),
              underline: Container(
                height: 2,
                color: Theme.of(context).accentColor,
              ),
              onChanged: (Collector newCollector) {
                setState(() {
                  selectedCollector = newCollector;
                });
              },
              items: collectors.map<DropdownMenuItem<Collector>>((Collector c) {
                return DropdownMenuItem<Collector>(
                  value: c,
                  child: Text(c.toString()),
                );
              }).toList(),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NovaColeta(selectedCollector);
                }));
              },
              child: Text(
                "Próximo", style:
                TextStyle(
                  color: Colors.grey[50],
                  fontSize: 16
                )
              ),
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:SPIRA/constants.dart' as contants;
import 'package:SPIRA/menu.dart';

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
        accentColor: contants.darkGreen,
        primaryColor: contants.brightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: SelectCollector(),
    );
  }
}

class SelectCollector extends StatefulWidget {
  @override
  _SelectCollectorState createState() => _SelectCollectorState();
}

class _SelectCollectorState extends State<SelectCollector> {
  contants.Collector selectedCollector = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPIRA - Selecione seu usuário"),
        backgroundColor: contants.brightGreen,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<contants.Collector>(
              value: selectedCollector,
              hint: Text("Selecione usuário"),
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.grey[900], fontSize: 18),
              underline: Container(
                height: 2,
                color: Theme.of(context).accentColor,
              ),
              onChanged: (contants.Collector newCollector) {
                setState(() {
                  selectedCollector = newCollector;
                });
              },
              items: contants.collectors
                  .map<DropdownMenuItem<contants.Collector>>(
                      (contants.Collector c) {
                return DropdownMenuItem<contants.Collector>(
                  value: c,
                  child: Text(c.toString()),
                );
              }).toList(),
            ),
            Builder(
              builder: (context) => FlatButton(
                onPressed: () {
                  if (selectedCollector == null) {
                    final snackBar = SnackBar(
                      content: Text('Selecione um usuário para prosseguir!'),
                    );

                    // Find the Scaffold in the widget tree and use
                    // it to show a SnackBar.
                    Scaffold.of(context).showSnackBar(snackBar);
                    return;
                  }

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Menu(selectedCollector);
                  }));
                },
                child: Text("Próximo",
                    style: TextStyle(color: Colors.grey[50], fontSize: 16)),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

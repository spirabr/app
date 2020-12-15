import 'package:flutter/material.dart';

import 'package:SPIRA/constants.dart' as contants;
import 'package:SPIRA/menu.dart';
import 'package:SPIRA/collector.dart';

class SelectCollector extends StatefulWidget {
  @override
  _SelectCollectorState createState() => _SelectCollectorState();
}

class _SelectCollectorState extends State<SelectCollector> {
  Collector selectedCollector;

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
            DropdownButton<Collector>(
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
              onChanged: (newCollector) {
                setState(() {
                  selectedCollector = newCollector;
                });
              },
              items: contants.collectors.map<DropdownMenuItem<Collector>>((c) {
                return DropdownMenuItem<Collector>(
                  value: c,
                  child: Text(c.toString()),
                );
              }).toList(),
            ),
            Builder(
              builder: (context) => TextButton(
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
                child: Text("Próximo"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(color: Colors.grey[50], fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

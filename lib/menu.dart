import 'package:SPIRA/recording.dart';
import 'package:flutter/material.dart';
import 'package:SPIRA/collector.dart';
import 'constants.dart';

class Menu extends StatefulWidget {
  final Collector selectedCollector;

  Menu(Collector this.selectedCollector);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPIRA - Menu Principal"),
        backgroundColor: brightGreen,
      ),
      body: Center(
        child: Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Bem vinda(o), ${widget.selectedCollector.toString()}!",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Container(
                    width: 186,
                    height: 191,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 70.0,
                        ),
                        Text(
                          "Nova Coleta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Recording();
                      }),
                    );
                  },
                ),
              ),
              Container(
                child: TextButton(
                  child: Text(
                    "Instruções",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

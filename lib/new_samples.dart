import 'package:flutter/material.dart';

import 'package:SPIRA/recording.dart';

class NewSamples extends StatefulWidget {
  NewSamples(String dropdownValue);
  @override
  _NewSamplesState createState() => _NewSamplesState();
}

class _NewSamplesState extends State<NewSamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                )),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.history,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "Histórico",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Recording();
                        }));
                      })),
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

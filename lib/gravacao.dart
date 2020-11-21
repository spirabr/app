import 'package:flutter/material.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';


class Gravacao extends StatefulWidget {

  final LocalFileSystem localFileSystem;

  Gravacao({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();


  @override
  _GravacaoState createState() => _GravacaoState();
}

class _GravacaoState extends State<Gravacao> {


  Recording _recording = Recording();
  bool _isRecording = false;

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
          await AudioRecorder.start();
        bool isRecordingAux = await AudioRecorder.isRecording;
        setState(() {
          _recording = Recording(duration: Duration(), path: "");
          _isRecording = isRecordingAux;
        });
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

   _stop() async {
    var recording = await AudioRecorder.stop();
    bool isRecording = await AudioRecorder.isRecording;
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text("Começar a gravar", 
                    style: TextStyle(color: Colors.white),
                ),
                onPressed: _isRecording ? null: _start,
              ),
            ),
            Container(
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text("Parar de gravar", 
                    style: TextStyle(color: Colors.white),
                ),
                onPressed: _isRecording ? _stop: null,
            )),
          ],
        ),
      ),
    );
  }
}

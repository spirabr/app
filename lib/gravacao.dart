import 'package:flutter/material.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/local.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Gravacao extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  Gravacao({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _GravacaoState createState() => _GravacaoState();
}

class _GravacaoState extends State<Gravacao> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  Recording _recording = Recording();
  bool _isRecording = false;

  void _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        await AudioRecorder.start();
        bool isRecordingAux = await AudioRecorder.isRecording;
        setState(() {
          _recording = Recording(duration: Duration(), path: "");
          _isRecording = isRecordingAux;
        });
      } else {
        //Scaffold.of(context).showSnackBar(
         //   SnackBar(content: Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  void _stop() async {
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
            StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: 0,
                builder: (context, snap) {
                  final time = snap.data;
                  return Text(StopWatchTimer.getDisplayTime(time, hours: false, minute: false), style: TextStyle(
                    fontSize: 38
                  ),);
                }),
            GestureDetector(
                onLongPressStart: (_) {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  _start();
                },
                onLongPressEnd: (_) {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  _stop();
                  _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                },
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: _isRecording ? Colors.grey : Theme.of(context).primaryColor,
                      shape: BoxShape.circle),
                ))
          ],
        ),
      ),
    );
  }
}

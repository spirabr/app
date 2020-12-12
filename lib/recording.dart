import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Recording extends StatefulWidget {
  @override
  _RecordingState createState() => _RecordingState();
}

class _RecordingState extends State<Recording> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  String _mPath;
  bool _mRecorderStarted;

  bool _isRecording = false;

  @override
  void initState() {
    openTheRecorder().then((value) {
      setState(() {
        _mRecorderStarted = true;
      });
    });
    super.initState();
  }

  Future<void> openTheRecorder() async {
    var tempDir = await getApplicationDocumentsDirectory();
    _mPath = '${tempDir.path}/flutter_sound_example.aac';
    var outputFile = File(_mPath);

    if (outputFile.existsSync()) {
      await outputFile.delete();
    }

    await _mRecorder.openAudioSession();

    _mRecorderStarted = true;
  }

  void _start() async {
    try {
      assert(_mRecorderStarted);

      await _mRecorder.startRecorder(
        toFile: _mPath,
        codec: Codec.aacADTS,
      );

      var isRecordingAux = _mRecorder.isRecording;

      setState(() {
        _isRecording = isRecordingAux;
      });
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      print(e);
    }
  }

  void _stop() async {
    await _mRecorder.stopRecorder();

    var isRecording = _mRecorder.isRecording;

    setState(() {
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
                  return Text(
                    StopWatchTimer.getDisplayTime(time,
                        hours: false, minute: false),
                    style: TextStyle(fontSize: 38),
                  );
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
                  color: _isRecording
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

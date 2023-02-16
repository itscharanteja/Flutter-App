import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(TimerApp());

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int _duration = 60;
  bool _isRunning = false;
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    Future.delayed(Duration(seconds: _duration), () {
      _audioPlayer.play('assets/sounds/bell.mp3', isLocal: true);
      setState(() {
        _isRunning = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Duration: $_duration seconds',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isRunning ? null : _startTimer,
                child: Text('Start Timer'),
              ),
              SizedBox(height: 16.0),
              _isRunning
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

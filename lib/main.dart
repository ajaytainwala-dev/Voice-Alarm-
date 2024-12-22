import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const VoiceAlarmApp());
}

class VoiceAlarmApp extends StatelessWidget {
  const VoiceAlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Alarm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
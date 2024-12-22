import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final TTSService instance = TTSService._internal();
  
  factory TTSService() {
    return instance;
  }

  final FlutterTts _flutterTts = FlutterTts();

  TTSService._internal() {
    _initTTS();
  }

  Future<void> _initTTS() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
  }

  Future<void> speak(String message) async {
    await _flutterTts.speak(message);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}
import 'dart:async';
import '../models/alarm.dart';
import 'tts_service.dart';

class AlarmService {
  static final AlarmService instance = AlarmService._internal();
  
  factory AlarmService() {
    return instance;
  }

  AlarmService._internal() {
    _startAlarmChecker();
  }

  final _alarms = <Alarm>[];
  final _alarmsController = StreamController<List<Alarm>>.broadcast();

  Stream<List<Alarm>> get alarmsStream => _alarmsController.stream;

  void _startAlarmChecker() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      _checkAlarms();
    });
  }

  void _checkAlarms() {
    final now = TimeOfDay.now();
    for (final alarm in _alarms) {
      if (alarm.isActive && 
          alarm.time.hour == now.hour && 
          alarm.time.minute == now.minute) {
        _speakAlarm(alarm);
      }
    }
  }

  Future<void> _speakAlarm(Alarm alarm) async {
    await TTSService.instance.speak(alarm.message);
  }

  void addAlarm(Alarm alarm) {
    _alarms.add(alarm);
    _notifyListeners();
  }

  void toggleAlarm(Alarm alarm) {
    final index = _alarms.indexOf(alarm);
    if (index != -1) {
      _alarms[index] = alarm.copyWith(isActive: !alarm.isActive);
      _notifyListeners();
    }
  }

  void deleteAlarm(Alarm alarm) {
    _alarms.remove(alarm);
    _notifyListeners();
  }

  void _notifyListeners() {
    _alarmsController.add(List.from(_alarms));
  }

  void dispose() {
    _alarmsController.close();
    TTSService.instance.stop();
  }
}
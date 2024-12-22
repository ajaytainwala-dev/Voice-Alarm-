import 'package:flutter/material.dart';
import '../models/alarm.dart';
import '../services/alarm_service.dart';

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({super.key});

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  final _textController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveAlarm() {
    if (_textController.text.isEmpty) return;

    final alarm = Alarm(
      time: _selectedTime,
      message: _textController.text,
      isActive: true,
    );

    AlarmService.instance.addAlarm(alarm);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Voice Alarm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Alarm Message',
                hintText: 'Enter the text to be spoken',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectTime,
              child: Text(
                'Select Time: ${_selectedTime.format(context)}',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAlarm,
              child: const Text('Save Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
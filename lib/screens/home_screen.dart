import 'package:flutter/material.dart';
import '../widgets/alarm_list.dart';
import '../widgets/add_alarm_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Alarms'),
      ),
      body: const Column(
        children: [
          Expanded(child: AlarmList()),
        ],
      ),
      floatingActionButton: const AddAlarmButton(),
    );
  }
}
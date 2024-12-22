import 'package:flutter/material.dart';
import '../models/alarm.dart';
import '../services/alarm_service.dart';

class AlarmList extends StatefulWidget {
  const AlarmList({super.key});

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Alarm>>(
      stream: AlarmService.instance.alarmsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No alarms set'),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final alarm = snapshot.data![index];
            return AlarmListItem(alarm: alarm);
          },
        );
      },
    );
  }
}
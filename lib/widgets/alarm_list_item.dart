import 'package:flutter/material.dart';
import '../models/alarm.dart';
import '../services/alarm_service.dart';
import '../utils/time_utils.dart';

class AlarmListItem extends StatelessWidget {
  final Alarm alarm;

  const AlarmListItem({super.key, required this.alarm});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(formatTimeOfDay(alarm.time)),
        subtitle: Text(alarm.message),
        trailing: Switch(
          value: alarm.isActive,
          onChanged: (value) {
            AlarmService.instance.toggleAlarm(alarm);
          },
        ),
        onLongPress: () {
          _showDeleteConfirmation(context);
        },
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Alarm'),
        content: const Text('Are you sure you want to delete this alarm?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              AlarmService.instance.deleteAlarm(alarm);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
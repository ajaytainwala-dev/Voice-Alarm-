import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

bool isSameTime(TimeOfDay time1, TimeOfDay time2) {
  return time1.hour == time2.hour && time1.minute == time2.minute;
}
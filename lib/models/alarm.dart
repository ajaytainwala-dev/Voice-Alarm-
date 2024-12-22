import 'package:flutter/material.dart';

class Alarm {
  final TimeOfDay time;
  final String message;
  final bool isActive;

  Alarm({
    required this.time,
    required this.message,
    required this.isActive,
  });

  Alarm copyWith({
    TimeOfDay? time,
    String? message,
    bool? isActive,
  }) {
    return Alarm(
      time: time ?? this.time,
      message: message ?? this.message,
      isActive: isActive ?? this.isActive,
    );
  }
}
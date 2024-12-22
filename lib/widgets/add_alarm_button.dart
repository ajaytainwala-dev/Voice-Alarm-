import 'package:flutter/material.dart';
import '../screens/add_alarm_screen.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddAlarmScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
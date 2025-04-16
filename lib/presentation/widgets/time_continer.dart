import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({super.key, required this.times});
  final String times;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          times,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

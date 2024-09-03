import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UI extends StatelessWidget {
  const UI({
    super.key,
    required this.weathertemp,
    required this.statue,
  });
  final double weathertemp;
  final String statue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Text(
                  '$weathertemp',
                  style: TextStyle(fontSize: 65, fontFamily: 'Roboto'),
                ),
                Text(
                  statue,
                  style: TextStyle(fontFamily: 'Roboto'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

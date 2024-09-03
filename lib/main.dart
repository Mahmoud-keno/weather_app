import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/pages/homepage.dart';
import 'package:timezone/data/latest.dart' as tz;
void main() {
  runApp(const Weather());
   tz.initializeTimeZones();
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: Homepage()),
    );
  }
}

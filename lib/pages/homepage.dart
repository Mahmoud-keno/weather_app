import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/errorsearch.dart';
import 'package:weather_app/pages/noinformation.dart';
import 'package:weather_app/pages/weatherinformation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
        // ignore: avoid_types_as_parameter_names
        builder: (context, state) {
      if (state is InitailState) {
        return const Noinformation();
      } else if (state is WeatherLoadedSuccessfully) {
        // ignore: prefer_const_constructors
        return  Weatherinformation();
      } else {
        // ignore: prefer_const_constructors
        return Errorsearch();
      }
    });
  }
}

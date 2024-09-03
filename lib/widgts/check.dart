import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgts/Sunny.dart';
import 'package:weather_app/widgts/cloud.dart';
import 'package:weather_app/widgts/fog.dart';
import 'package:weather_app/widgts/idk.dart';

class Check extends StatelessWidget {
  const Check({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherLoadedData =
        BlocProvider.of<GetWeatherCubit>(context).weatherdata;
    String statue = weatherLoadedData.statue;
    if (statue.contains('cloudy') || statue.contains('Clear') || statue.contains('Rain') || statue.contains('rainy')) {
      return  Cloud();
    } else if (statue.contains('Sunny')){
      return  Sunny();
    } else if (statue.contains('Windy') || statue.contains('foggy')) {
      return  Fog();
    }
    else{
      return  Idk();
    }
  }
}

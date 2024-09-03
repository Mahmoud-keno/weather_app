import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgts/ui.dart';

class Idk extends StatelessWidget {
  const Idk({super.key});

  @override
  Widget build(BuildContext context) {
   var weatherLoadedData = BlocProvider.of<GetWeatherCubit>(context).weatherdata;
    String statue = weatherLoadedData.statue; 
    return Container(width: double.infinity,
              height: 350,
              decoration:const BoxDecoration(
                gradient: LinearGradient (
                  colors:  [
                  Color(0xff9CC5F1),
                  Color(0xffB4D8F7),
                  Color(0xffE6FAF4),
                  Color(0xffF7FCD3),
                  Color.fromARGB(255, 253, 255, 236),
                  Colors.white,
                  Colors.white
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: UI(
                weathertemp: weatherLoadedData.temp,
                statue: statue,
              ),);
  }
}
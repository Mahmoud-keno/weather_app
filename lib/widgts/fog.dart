import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgts/ui.dart';

class Fog extends StatelessWidget {
  const Fog({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherLoadedData = BlocProvider.of<GetWeatherCubit>(context).weatherdata;
    String statue = weatherLoadedData.statue;
    return Container(width: double.infinity,
              height: 350,
              decoration:const BoxDecoration(
                gradient: LinearGradient (
                  colors:  [
                  Color(0xffF2D9A3),
                  Color(0xffE2D3B6),
                  Color(0xffD0CCCD),
                  Color(0xffC0C6E0),
                  Color(0xffBBC3E8),
                  Color.fromARGB(255, 208, 217, 255),
                  Colors.white,
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
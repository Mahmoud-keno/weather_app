// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgts/ui.dart';
class Sunny extends StatelessWidget {
  const Sunny({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherLoadedData = BlocProvider.of<GetWeatherCubit>(context).weatherdata;
    String statue = weatherLoadedData.statue;
    return Container(width: double.infinity,
              height: 350,
              decoration:const BoxDecoration(
                gradient: LinearGradient (
                  colors:  [
                    Color(0xffFD927E),
                    Color(0xffFD9F74),
                    Color(0xffFCAD6A),
                    Color.fromARGB(255, 253, 197, 138),
                    Color.fromARGB(255, 255, 217, 176),
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
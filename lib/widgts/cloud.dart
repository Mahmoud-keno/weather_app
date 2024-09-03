import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgts/ui.dart';

class Cloud extends StatelessWidget {
  const Cloud({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherLoadedData = BlocProvider.of<GetWeatherCubit>(context).weatherdata;
    String statue = weatherLoadedData.statue;
    return Container(width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffB4D8FC),
                    Color(0xffB4D8FC),
                    Color(0xffB4D8FC),
                    Color(0xffE1F1FE),
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

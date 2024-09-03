import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add location',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xff49454F),
            fontFamily: 'Bebas Neue',
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SearchBar(
            hintText: 'Search Your City',
            onSubmitted: (value) {
              GetWeatherCubit getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getweather(cityname: value);
              Navigator.pop(context);
            },
            leading: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.search),
            ),
          )),
    );
  }
}

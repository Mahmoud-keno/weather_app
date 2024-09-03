import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api_request.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitailState());
  late WeatherModel weatherdata;
  getweather({required String cityname}) async {
    try {
      weatherdata = await WeatherApiRequest(dio: Dio()).GetWeather(cityname);
      emit(WeatherLoadedSuccessfully(weatherdata: weatherdata));
    } catch (e) {
      emit(WeatherFailedToLoad());
    }
  }
}

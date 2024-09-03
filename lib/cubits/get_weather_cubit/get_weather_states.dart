// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitailState extends WeatherStates {}

class WeatherLoadedSuccessfully extends WeatherStates {
  WeatherModel weatherdata;
  WeatherLoadedSuccessfully({required this.weatherdata});
}

class WeatherFailedToLoad extends WeatherStates {}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
class WeatherApiRequest {
  final Dio dio;
  WeatherApiRequest({required this.dio});
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '76b511716a9f4795a9c143423242008';
  // ignore: non_constant_identifier_names
  Future<WeatherModel> GetWeather(String city) async {
    try {
      Response response =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1&aqi=yes&alerts=no');
      WeatherModel weatherResponse = WeatherModel.fromjson(response.data);
      return weatherResponse;
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message'] ?? 'Try again' ;
      throw Exception(errormessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Try Later');
    }
  }
}

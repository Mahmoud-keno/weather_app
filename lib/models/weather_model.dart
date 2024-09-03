class WeatherModel {
  final String cityname;
  final double temp;
  // ignore: non_constant_identifier_names
  final double chance_of_rain;
  // ignore: non_constant_identifier_names
  final double chance_of_snow;
  final String data;
  final String image;
  final String statue;
  // ignore: non_constant_identifier_names
  final String timezone_id;
  WeatherModel( 
      // ignore: non_constant_identifier_names
      {
    required this.temp,
    required this.cityname,
    // ignore: non_constant_identifier_names
    required this.chance_of_rain,
    // ignore: non_constant_identifier_names
    required this.chance_of_snow,
    required this.data,
    required this.image,
    required this.statue,
    // ignore: non_constant_identifier_names
    required this.timezone_id
  });
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      timezone_id: json['location']['tz_id'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        cityname: json['location']['name'],
        chance_of_snow: json['forecast']['forecastday'][0]['hour'][1]['chance_of_snow'],
        chance_of_rain: json['forecast']['forecastday'][0]['hour'][1]['chance_of_rain'],
        data: json['current']['last_updated'],
        image: json['current']['condition']['icon'],
        statue: json['current']['condition']['text']
        )
        ;
  }
}

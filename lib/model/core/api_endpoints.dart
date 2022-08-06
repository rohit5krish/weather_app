import 'package:weather_app/model/core/apikey.dart';

class ApiEndpoints {
  static const weatherUrl =
      'https://api.openweathermap.org/data/2.5/forecast?q=kochi&units=metric&appid=$apiKey';
  static const climateImgUrl = 'http://openweathermap.org/img/wn';
}

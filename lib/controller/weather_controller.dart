import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/service/api_service.dart';

class WeatherController extends GetxController {
  var isLoading = false;
  var isError = false;
  var weatherData = WeatherModel();

  Future<void> getWeatherData(
      {Position? userLocation, String? savedPlace}) async {
    isLoading = true;
    isError = false;
    update();
    var weatherResult;
    if (userLocation != null) {
      weatherResult = await ApiService().getWeather(usrLocation: userLocation);
    } else if (savedPlace != null) {
      weatherResult = await ApiService().getWeather(place: savedPlace);
    }
    weatherResult.fold((failure) {
      isLoading = false;
      isError = true;
    }, (success) {
      isLoading = false;
      isError = false;
      weatherData = success;
    });
    update();
  }
}

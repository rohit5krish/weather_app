import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/core/api_endpoints.dart';
import 'package:weather_app/model/failures/main_failure.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';

class ApiService {
  Future<Either<MainFailure, WeatherModel>> getWeather(
      {String? place, Position? usrLocation}) async {
    try {
      final Response response;
      if (place != null) {
        response = await Dio()
            .get(ApiEndpoints.weatherUrl, queryParameters: {'q': place});
      } else {
        response = await Dio().get(ApiEndpoints.weatherLatLongUrl,
            queryParameters: {
              'lat': usrLocation!.latitude,
              'lon': usrLocation.longitude
            });
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = WeatherModel.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}

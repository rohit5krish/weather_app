import 'package:json_annotation/json_annotation.dart';

import 'all_json_files/main.dart';
import 'all_json_files/weather.dart';
import 'all_json_files/wind.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  List<ListDatas>? list;
  City? city;

  WeatherModel({this.list, this.city});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class ListDatas {
  Main? main;
  List<Weather>? weather;
  Wind? wind;
  @JsonKey(name: 'dt_txt')
  String? dtTxt;

  ListDatas({
    this.main,
    this.weather,
    this.wind,
    this.dtTxt,
  });

  factory ListDatas.fromJson(Map<String, dynamic> json) =>
      _$ListDatasFromJson(json);

  Map<String, dynamic> toJson() => _$ListDatasToJson(this);
}

@JsonSerializable()
class City {
  String? name;
  String? country;

  City({
    this.name,
    this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

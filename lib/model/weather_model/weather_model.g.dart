// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ListDatas.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };

ListDatas _$ListDatasFromJson(Map<String, dynamic> json) => ListDatas(
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String?,
    );

Map<String, dynamic> _$ListDatasToJson(ListDatas instance) => <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'dt_txt': instance.dtTxt,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      name: json['name'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
    };

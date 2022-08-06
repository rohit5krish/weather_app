import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main {
  double? temp;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

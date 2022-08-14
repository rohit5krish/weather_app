import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';

class ForecastInheritedWidget extends InheritedWidget {
  final List<ListDatas> forecastList;
  const ForecastInheritedWidget(
      {Key? key, required this.forecastList, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ForecastInheritedWidget oldWidget) {
    return oldWidget.forecastList != forecastList;
  }

  static ForecastInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ForecastInheritedWidget>();
  }
}

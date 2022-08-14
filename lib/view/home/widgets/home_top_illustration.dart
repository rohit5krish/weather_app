import 'package:flutter/material.dart';

class HomeTopIllustration extends StatelessWidget {
  const HomeTopIllustration({
    Key? key,
    required this.screenSize,
    required this.climateDescription,
    required this.climate,
  }) : super(key: key);

  final Size screenSize;
  final String climateDescription;
  final String climate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.65,
      height: screenSize.height * 0.25,
      child: Image.asset((climateDescription == 'moderate rain')
          ? 'assets/thunder_rain.png'
          : (climate == 'Clear' || climate == 'Clouds')
              ? 'assets/clouds.png'
              : (climateDescription == 'light rain')
                  ? 'assets/cloud_rain.png'
                  : (climateDescription == 'overcast clouds')
                      ? 'assets/thunder_rain.png'
                      : (climate == 'Rain')
                          ? 'assets/thunder_rain.png'
                          : (climate == 'Thunder')
                              ? 'assets/sun_thunder.png'
                              : 'assets/cloud_sun.png'),
    );
  }
}

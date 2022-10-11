import 'package:flutter/cupertino.dart';
import 'package:untitled11/widgets/weather.card.dart';

import '../class_weather/class_weather.dart';

class HourlyWeather extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const HourlyWeather({Key key,this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyWeather.length,
            itemBuilder: (context, i) {
              return WeatherCard(
                title:
                '${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
                temperature: hourlyWeather[i].temperature.toInt(),
                iconCode: hourlyWeather[i].iconCode,
                humidity: hourlyWeather[i].humidity,
                pressure: hourlyWeather[i].pressure,
                wind: hourlyWeather[i].wind,
                temperatureFontSize: 20,// настройка погоды почасам и сразу на 3 дня
              );
            }));
  }
}
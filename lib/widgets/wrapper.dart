import 'package:flutter/cupertino.dart';
import 'package:untitled11/widgets/weather.card.dart';

import '../class_weather/class_weather.dart';
import 'hour.dart';

class MainScreenWrapper extends StatelessWidget {
  final Weather weather;
  final List<Weather> hourlyWeather;


  const MainScreenWrapper({Key key, this.weather, this.hourlyWeather, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          weather.cityName,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),// настройка текста с блоком
        ),
        Text(
            '${weather.description}'),
        Spacer(),
        WeatherCard(
          title: "Now",
          temperature: weather.temperature,
          iconCode: weather.iconCode,
          temperatureFontSize: 64,
          iconScale: 1,
          humidity:weather.humidity,
          pressure: weather.pressure,
          wind: weather.wind,// настройка части по центру
        ),
        Spacer(),
        HourlyWeather(hourlyWeather: this.hourlyWeather)
      ]),
    );
  }
}
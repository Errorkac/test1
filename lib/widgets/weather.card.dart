import 'package:flutter/cupertino.dart';
import '';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;
  final int humidity;
  final int pressure;
  final double wind; // добавляем наши значения

  const WeatherCard({Key key,this.title,this.temperature,this.iconCode, this.temperatureFontSize = 32, this.iconScale = 2, this.humidity, this.pressure, this.wind}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        // Добавляем отступы
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Выравниваем по центру
            children: [
              Text(this.title),
              Image.network("http://openweathermap.org/img/wn/${this.iconCode}@2x.png", scale: this.iconScale),// берем иконки с сайта
              Text(
                '${this.temperature}°',
                style: TextStyle(fontSize: this.temperatureFontSize, fontWeight: FontWeight.bold),
              ),
              Text(
                '${this.humidity} %',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${this.pressure} bar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${this.wind} m/s',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),// здесь мы вставляем все значения в наше приложение
              ),
            ],
          ),
        ),
      ),
    );
  }
}
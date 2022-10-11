class Weather {
  final String cityName;
  final int temperature;
  final String iconCode;
  final String description;
  final DateTime time;
  final int humidity;
  final int pressure;
  final double wind;

  Weather({this.cityName,
    this.temperature,
    this.iconCode,
    this.description,
    this.time,
    this.humidity,
    this.pressure,
    this.wind});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: double.parse(json['main']['temp'].toString()).toInt(),
      iconCode: json['weather'][0]['icon'],
      description: json['weather'][0]['main'],
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      humidity: int.parse(json ['main']['humidity'].toString()),
      pressure: int.parse(json ['main']['pressure'].toString()),
      wind: double.parse(json['wind']['speed'].toString()),// здесь мы создаем информацию о погоде и настраиваем расширофровку json
    );
  }
}
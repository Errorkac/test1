import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../class_weather/class_weather.dart';
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> hourlyWeather;

  const WeatherLoadSuccess(
      {this.weather,this.hourlyWeather,})
      : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailure extends WeatherState {}
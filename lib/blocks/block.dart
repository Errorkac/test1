import 'package:bloc/bloc.dart';
import '../class_weather/class_weather.dart';
import '../ivents/ivent.dart';
import '../services/Api.dart';
import '../states/state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String cityName;
  WeatherBloc(this.cityName) : super(null) {
    add(WeatherRequested(city: cityName));
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather =
        await WeatherService.fetchCurrentWeather(query: event.city);
        final List<Weather> hourlyWeather =
        await WeatherService.fetchHourlyWeather(query: event.city);
        yield WeatherLoadSuccess(
            weather: weather, hourlyWeather: hourlyWeather,);
      } catch (_) {
        yield WeatherLoadFailure();// настраиваем обновления информации через блоки 
      }
    }
  }
}
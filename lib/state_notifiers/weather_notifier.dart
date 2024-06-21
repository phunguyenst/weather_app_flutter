import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/services/api_helper.dart';
import 'package:weather_app_tutorial/states/weather_state.dart';

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier() : super(const WeatherState());

  Future<void> fetchWeather() async {
    state = state.copyWith(isLoading: true);
    try {
      final weather = await ApiHelper.getCurrentWeather();
      print("Weatherlogger: $weather");
      state = state.copyWith(weather: weather, isLoading: false);
      print(
          "Weatherlogger: ${state.weather!.name} ${state.weather!.weather[0].description}");
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}

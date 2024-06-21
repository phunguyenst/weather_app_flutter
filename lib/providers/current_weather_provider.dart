import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:weather_app_tutorial/services/api_helper.dart';
import 'package:weather_app_tutorial/state_notifiers/weather_notifier.dart';
import 'package:weather_app_tutorial/states/weather_state.dart';

// final currentWeatherProvider = FutureProvider.autoDispose((ref) {
//   return ApiHelper.getCurrentWeather();
// });

final currentWeatherProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  return WeatherNotifier();
});

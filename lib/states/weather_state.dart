import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/models/weather.dart';

@immutable
class WeatherState {
  final Weather? weather;
  final bool isLoading;
  final String? error;

  const WeatherState({
    this.weather,
    this.isLoading = false,
    this.error,
  });

  WeatherState copyWith({
    Weather? weather,
    bool? isLoading,
    String? error,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

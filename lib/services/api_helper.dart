import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:weather_app_tutorial/constants/constants.dart';
import 'package:weather_app_tutorial/models/hourly_weather.dart';
import 'package:weather_app_tutorial/models/weather.dart';
import 'package:weather_app_tutorial/services/geolocator.dart';
import 'package:weather_app_tutorial/utils/logging.dart';

@immutable
class ApiHelper {
  static const baseUrl = "http://api.openweathermap.org/data/2.5";
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';
  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();
  static Future<void> fetchLocation() async {
    final location = await getCurrentLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  //current weather
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherURL();
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  //Hourly Weather
  static Future<HourlyWeather> getHourlyWeather() async {
    await fetchLocation();
    final url = _constructForecastURL();
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  //Weekly Weather
  static Future<HourlyWeather> getWeeklyWeather() async {
    await fetchLocation();
    final url = _constructWeeklyForecastURL();
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  //Weather by city Name
  static Future<Weather> getWeatherByCityName({
    required String cityName,
  }) async {
    final url = _constructWeatherByCityUrl(cityName);
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  static String _constructWeatherURL() {
    return '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  }

  static String _constructForecastURL() {
    return '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  }

  static String _constructWeatherByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

  static String _constructWeeklyForecastURL() {
    return '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  }

  // Fetch data url
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      printWarning("error fecthing data: $e");
      throw Exception('Failed to load data');
    }
  }
}

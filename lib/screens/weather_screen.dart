import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/providers/current_weather_provider.dart';
import 'package:weather_app_tutorial/views/hourly_forecast_view.dart';
import 'package:weather_app_tutorial/views/weather_info.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(currentWeatherProvider);
    if (!weather.isLoading &&
        weather.weather == null &&
        weather.error == null) {
      Future.microtask(
          () => ref.read(currentWeatherProvider.notifier).fetchWeather());
    }
    if (weather.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (weather.error != null) {
      return Text('Error: ${weather.error}');
    }
    if (weather.weather != null) {
      return GradientContainer(children: [
        const SizedBox(
          width: double.infinity,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weather.weather!.name,
              style: TextStyles.h1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              DateTime.now().dateTime,
              style: TextStyles.subtitleText,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: Image.asset(
                  'assets/icons/${weather.weather!.weather[0].icon.replaceAll('n', 'd')}.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              weather.weather!.weather[0].description,
              style: TextStyles.h3,
            ),
          ],
        ),

        const SizedBox(
          height: 40,
        ),
        WeatherInfo(weather: weather.weather!),
        const SizedBox(
          height: 30,
        ),
        //view for hourly weather
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Today',
              style: TextStyles.h2,
            ),
            TextButton(
                onPressed: () {}, child: const Text("View full forecast"))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const HourlyForecastView(),
      ]);
    }
    return const SizedBox(
      child: Text("No data"),
    );
  }
}

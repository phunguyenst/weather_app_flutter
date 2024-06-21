import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/providers/get_city_forebase_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

class FamousCityTile extends ConsumerWidget {
  const FamousCityTile({
    Key? key,
    required this.index,
    required this.city,
  }) : super(key: key);
  final String city;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(cityForecastProvider(city));

    print("weatherData: $weatherData");
    print("city1: $city");

    return weatherData.when(data: (data) {
      return Material(
        color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
        elevation: index == 0 ? 8 : 0,
        borderRadius: BorderRadius.circular(25.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.main.temp.round().toString()}°',
                          style: TextStyles.h2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.weather[0].description,
                          style: TextStyles.subtitleText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    getWeatherIcon(weatherCode: data.weather[0].id),
                    width: 50,
                  ),
                ],
              ),
              Text(
                data.name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white..withOpacity(.8),
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return Text('Error: $error');
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

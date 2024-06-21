import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/providers/weekly_weather_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

import 'package:weather_app_tutorial/widgets/subscript_text.dart';

class WeeklyForecastView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyForecastProvider);
    print("Weekly Forecast Data: $weeklyForecastData");
    return weeklyForecastData.when(data: (data) {
      return ListView.builder(
          itemCount: data.daily.weatherCode.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek = DateTime.parse(data.daily.time[index]).dayOfWeek;
            final date = data.daily.time[index];
            final temp = data.daily.temperature2mMax[index].round();
            final icon = data.daily.weatherCode[index];
            return WeeklyWeatherTile(
              day: dayOfWeek,
              date: date,
              temp: temp.toInt(),
              icon: getWeatherIcon2(icon),
            );
          });
    }, error: (error, stackTrace) {
      return Text('Error: $error');
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class WeeklyWeatherTile extends StatelessWidget {
  final String day;
  final String date;
  final int temp;
  final String icon;

  const WeeklyWeatherTile({
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.accentBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: TextStyles.subtitleText,
              )
            ],
          ),
          SuperscriptText(
              text: temp.toString(),
              superScript: "°C",
              color: AppColors.white,
              superscriptColor: AppColors.grey),
          Image.asset(
            icon,
            width: 60,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/hourly_forecast_view.dart';
import 'package:weather_app_tutorial/views/weekly_forecast_view.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Forecast Report",
              style: TextStyles.h1,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyles.h1,
              ),
              Text(DateTime.now().dateTime, style: TextStyles.subtitleText)
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
          const HourlyForecastView(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Next Forecast",
                style: TextStyles.h1,
              ),
              Icon(Icons.calendar_month_outlined, color: Colors.white),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          WeeklyForecastView(),
        ],
      ),
    );
  }
}

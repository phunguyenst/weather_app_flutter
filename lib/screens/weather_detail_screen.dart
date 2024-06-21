import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/extensions/strings.dart';
import 'package:weather_app_tutorial/providers/get_city_forebase_provider.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/weather_info.dart';

class WeatherDetailScreen extends ConsumerWidget {
  final String city;
  const WeatherDetailScreen({Key? key, required this.city}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(cityForecastProvider(city));

    return Scaffold(
      appBar: AppBar(
        //làm nút trở về trang trước
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            (context).go('/');
          },
        ),
      ),
      body: weather.when(data: (data) {
        return GradientContainer(children: [
          const SizedBox(
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data.name,
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
                    'assets/icons/${data.weather[0].icon.replaceAll('n', 'd')}.png'),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(data.weather[0].description.capitalize,
                  style: TextStyles.h3),
              WeatherInfo(weather: data),
              const SizedBox(
                height: 30,
              ),
            ],
          )
        ]);
      }, error: (error, stackTrace) {
        return Text('Error: $error');
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:weather_app_tutorial/screens/home_screen.dart';
import 'package:weather_app_tutorial/screens/search_screen.dart';
import 'package:weather_app_tutorial/screens/weather_detail_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/weather/:city',
      builder: (context, state) {
        final city = state.pathParameters['city'] ?? 'Unknown';
        return WeatherDetailScreen(city: city);
      },
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    )
  ],
);

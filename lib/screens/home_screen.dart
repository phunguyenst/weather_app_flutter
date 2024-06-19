import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final _destinations = const [
    NavigationDestination(
        icon: Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: ""),
    NavigationDestination(
        icon: Icon(
          Icons.search_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        label: ""),
    NavigationDestination(
        icon: Icon(
          Icons.wb_sunny_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.wb_sunny,
          color: Colors.white,
        ),
        label: ""),
    NavigationDestination(
        icon: Icon(
          Icons.settings_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        label: ""),
  ];
  final _screen = [
    const WeatherScreen(),
    const Center(
      child: Text("Search Screen"),
    ),
    const Center(
      child: Text("Weather Screen"),
    ),
    const Center(
      child: Text("Setting Screen"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(backgroundColor: AppColors.secondaryBlack),
        child: NavigationBar(
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}

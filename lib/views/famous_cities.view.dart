import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/models/famous_city.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_tutorial/widgets/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  final List<FamousCity> cities;

  const FamousCitiesView({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: cities.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          final city = cities[index];
          return InkWell(
              onTap: () {
                context.go('/weather/${city.name}');
              },
              child: FamousCityTile(index: index, city: city.name));
        });
  }
}

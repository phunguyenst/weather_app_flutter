class FamousCity {
  final String name;
  final double lat;
  final double lon;
  const FamousCity({
    required this.name,
    required this.lat,
    required this.lon,
  });
  @override
  String toString() {
    return 'FamousCity{name: $name, lat: $lat, lon: $lon}';
  }
}

List<FamousCity> famousCities = [
  const FamousCity(name: "Ho Chi Minh City", lat: 10.8231, lon: 106.6297),
  const FamousCity(name: "Ha Noi", lat: 21.0245, lon: 105.8412),
  const FamousCity(name: "Ca Mau", lat: 9.1760, lon: 105.1524),
  const FamousCity(name: "Ba Ria", lat: 10.4963, lon: 107.1688),
  const FamousCity(name: "Bac Giang", lat: 21.2667, lon: 106.2),
  const FamousCity(name: "Da Nang", lat: 16.0678, lon: 108.2208),
];
// List<FamousCity> famousCities = const [
//   FamousCity(name: 'Tokyo', lat: 35.6833, lon: 139.7667),
//   FamousCity(name: 'New Delhi', lat: 28.5833, lon: 77.2),
//   FamousCity(name: 'Paris', lat: 48.85, lon: 2.3333),
//   FamousCity(name: 'London', lat: 51.4833, lon: -0.0833),
//   FamousCity(name: 'New York', lat: 40.7167, lon: -74.0167),
//   FamousCity(name: 'Tehran', lat: 35.6833, lon: 51.4167),
// ];

import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permission denied forever');
  }
  return await Geolocator.getCurrentPosition();
}

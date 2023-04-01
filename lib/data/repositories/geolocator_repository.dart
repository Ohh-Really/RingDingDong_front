import 'package:geolocator/geolocator.dart';
import 'package:ringdingdong/domain/repositories/geolocator_repository.dart';

class GeolocatorRepositoryIml extends GeolocatorRepository {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}

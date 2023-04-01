import 'package:get/get.dart';
import 'package:ringdingdong/data/repositories/geolocator_repository.dart';
import 'package:ringdingdong/domain/usecases/get_location_use_case.dart';
import 'package:ringdingdong/presentation/controllers/geolocator/geolocator_controller.dart';

class GeolocatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetLocationUseCase(Get.find<GeolocatorRepositoryIml>()));
    Get.put(GeolocatorController(Get.find()), permanent: true);
  }
}

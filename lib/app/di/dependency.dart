import "package:get/get.dart";
import "package:ringdingdong/data/repositories/auth_repository.dart";
import "package:ringdingdong/data/repositories/geolocator_repository.dart";

class DependencyCreator {
  static init() {
    Get.lazyPut(() => AuthRepositoryIml());
    Get.lazyPut(() => GeolocatorRepositoryIml());
  }
}

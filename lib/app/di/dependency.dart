import "package:get/get.dart";
import "package:ringdingdong/data/repositories/auth_repository.dart";

class DependencyCreator {
  static init() {
    Get.lazyPut(() => AuthRepositoryIml());
  }
}

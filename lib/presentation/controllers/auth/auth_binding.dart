import 'package:get/get.dart';
import 'package:ringdingdong/data/repositories/auth_repository.dart';
import 'package:ringdingdong/domain/usecases/auth_use_cases.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthUseCase(Get.find<AuthRepositoryIml>()));
    Get.put(AuthController(Get.find()), permanent: true);
  }
}

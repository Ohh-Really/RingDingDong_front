import 'package:get/get.dart';
import 'package:ringdingdong/data/repositories/auth_repository.dart';
import 'package:ringdingdong/domain/usercases/login_use_case.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepositoryIml>()));
    Get.put(AuthController(Get.find()), permanent: true);
  }
}

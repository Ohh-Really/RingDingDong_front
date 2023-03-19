import 'package:get/get.dart';
import 'package:ringdingdong/domain/usecases/get_location_use_case.dart';

class GeolocatorController extends GetxController {
  GeolocatorController(this._getLocationUseCase);
  final GetLocationUseCase _getLocationUseCase;

  @override
  void onInit() async {
    super.onInit();
  }

  getLocation() async {
    final location = await _getLocationUseCase.execute();
    print(location);
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:ringdingdong/app/core/usecases/no_param_usecase.dart';
import 'package:ringdingdong/domain/repositories/geolocator_repository.dart';

class GetLocationUseCase extends NoParamUseCase<void> {
  final GeolocatorRepository _repo;
  GetLocationUseCase(this._repo);

  @override
  Future<Position> execute() {
    return _repo.getCurrentLocation();
  }
}

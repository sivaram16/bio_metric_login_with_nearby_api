import 'package:freelance_demo/authentication/authentication_cubit.dart';
import 'package:freelance_demo/http/model/petronas_data.dart';
import 'package:freelance_demo/http/repository/home_repository.dart';
import 'package:freelance_demo/screens/home/cubit/home_state.dart';
import 'package:freelance_demo/utils/base_cubit.dart';
import 'package:geolocator/geolocator.dart';

class HomeCubit extends BaseCubit<HomeState> {
  AuthenticationCubit authenticationCubit;
  List<PetronasData> petronasData = [];
  HomeCubit(this.authenticationCubit) : super(HomeInitialState());

  Future<void> init() async {
    LocationPermission permission;

    petronasData.clear();
    emit(HomeLoadingState());
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      emit(HomeErrorState("Location services are disabled."));
    } else {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(HomeErrorState("Location permissions are denied"));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(HomeErrorState(
            "Location permissions are permanently denied, we cannot request permissions."));
        return;
      }
      final position = await Geolocator.getCurrentPosition();
      final response = await HomeRepository.getPetronas(
          position.latitude, position.longitude);
      petronasData.addAll(response.results!);
    }

    emit(HomeRefreshState());
  }
}

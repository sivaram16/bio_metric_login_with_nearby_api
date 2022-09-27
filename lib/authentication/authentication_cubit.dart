import 'package:freelance_demo/authentication/authentication_state.dart';
import 'package:freelance_demo/utils/base_cubit.dart';
import 'package:freelance_demo/utils/preference_helper.dart';

class AuthenticationCubit extends BaseCubit<AuthenticationState> {
  late bool isLoggedIn;
  AuthenticationCubit() : super(AuthenticationInitialState());

  Future<void> init() async {
    emit(AuthenticationLoadingState());
    isLoggedIn = await PreferenceHelper.isLoggedIn();
    if (isLoggedIn) {
      emit(AuthenticationAuthenticatedState());
    } else {
      emit(AuthenticationUnAuthenticatedState());
    }
  }

  Future<void> loggin() async {
    emit(AuthenticationLoadingState());
    isLoggedIn = await PreferenceHelper.isLoggedIn();
    emit(AuthenticationAuthenticatedState());
  }

  Future<void> logout() async {
    emit(AuthenticationLoadingState());
    await PreferenceHelper.clearStorage();
    emit(AuthenticationUnAuthenticatedState());
  }
}

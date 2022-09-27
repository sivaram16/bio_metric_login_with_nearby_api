import 'package:flutter/services.dart';
import 'package:freelance_demo/authentication/authentication_cubit.dart';
import 'package:freelance_demo/screens/login/cubit/login_state.dart';
import 'package:freelance_demo/utils/base_cubit.dart';
import 'package:freelance_demo/utils/preference_helper.dart';
import 'package:local_auth/local_auth.dart';

class LoginCubit extends BaseCubit<LoginScreenState> {
  AuthenticationCubit authenticationCubit;
  LoginCubit(this.authenticationCubit) : super(LoginInitialState());

  Future<void> init() async {}

  Future<void> loginWithBioMetrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (canAuthenticate) {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to proceed',
            options: const AuthenticationOptions(biometricOnly: true));
        if (didAuthenticate) {
          await PreferenceHelper.saveLogin(didAuthenticate);
          authenticationCubit.loggin();
        }
      } on PlatformException {
        emit(LoginErrorState("Error occured"));
      }
    }
  }
}

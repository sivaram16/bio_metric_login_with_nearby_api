import 'package:freelance_demo/utils/base_equatable.dart';

class AuthenticationState extends BaseEquatable {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {}

class AuthenticationUnAuthenticatedState extends AuthenticationState {}

class AuthenticationRefreshState extends AuthenticationState {
  @override
  bool operator ==(Object other) => false;
}

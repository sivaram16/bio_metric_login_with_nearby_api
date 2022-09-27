import 'package:freelance_demo/utils/base_equatable.dart';

class LoginScreenState extends BaseEquatable {}

class LoginInitialState extends LoginScreenState {}

class LoginLoadingState extends LoginScreenState {}

class LoginRefreshState extends LoginScreenState {
  @override
  bool operator ==(Object other) => false;
}

class LoginErrorState extends LoginScreenState {
  final String error;
  LoginErrorState(this.error);
  @override
  bool operator ==(Object other) => false;
}

import 'package:freelance_demo/utils/base_equatable.dart';

class HomeState extends BaseEquatable {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRefreshState extends HomeState {
  @override
  bool operator ==(Object other) => false;
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
  @override
  bool operator ==(Object other) => false;
}

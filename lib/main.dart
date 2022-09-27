import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_demo/authentication/authentication_cubit.dart';
import 'package:freelance_demo/cubit.dart';
import 'package:freelance_demo/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider<AuthenticationCubit>(
    create: (BuildContext context) {
      return AuthenticationCubit()..init();
    },
    child: const MyApp(),
  ));
  Bloc.observer = EchoCubitDelegate();
}

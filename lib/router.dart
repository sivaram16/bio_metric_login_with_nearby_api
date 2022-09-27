import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_demo/authentication/authentication_cubit.dart';
import 'package:freelance_demo/authentication/authentication_state.dart';
import 'package:freelance_demo/screens/home/cubit/home_cubit.dart';
import 'package:freelance_demo/screens/home/home_screen.dart';
import 'package:freelance_demo/screens/login/cubit/login_cubit.dart';
import 'package:freelance_demo/screens/login/login_screen.dart';
import 'package:freelance_demo/widgets/custom_circular_progress_indicator.dart';

class AppRoutes {
  static const String login = "login";
  static const String home = "home";
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return _buildLoginScreen();
    case AppRoutes.home:
      return _buildHomeScreen();
    default:
      return _buildLoginScreen();
  }
}

MaterialPageRoute _buildLoginScreen() {
  return MaterialPageRoute(
    settings: const RouteSettings(name: AppRoutes.login),
    builder: (context) => addAuth(context, PageBuilder.buildLoginScreen()),
  );
}

MaterialPageRoute _buildHomeScreen() {
  return MaterialPageRoute(
    settings: const RouteSettings(name: AppRoutes.home),
    builder: (context) => addAuth(context, PageBuilder.buildHomeScreen()),
  );
}

Widget addAuth(BuildContext context, Widget widget) {
  final AuthenticationCubit authenticationCubit =
      BlocProvider.of<AuthenticationCubit>(context);

  return BlocListener(
    bloc: authenticationCubit,
    listener: (BuildContext context, AuthenticationState state) {
      if (state is AuthenticationUnAuthenticatedState) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }

      if (state is AuthenticationAuthenticatedState) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }

        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    },
    child: BlocBuilder(
      bloc: authenticationCubit,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationInitialState ||
            state is AuthenticationLoadingState) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CustomCircularProgressIndicator(),
            ),
          );
        } else {
          return widget;
        }
      },
    ),
  );
}

class PageBuilder {
  static Widget buildLoginScreen() {
    return BlocProvider(
      create: (context) {
        final AuthenticationCubit authenticationCubit =
            BlocProvider.of<AuthenticationCubit>(context);
        return LoginCubit(authenticationCubit)..init();
      },
      child: const LoginScreen(),
    );
  }

  static Widget buildHomeScreen() {
    return BlocProvider(
      create: (context) {
        final AuthenticationCubit authenticationCubit =
            BlocProvider.of<AuthenticationCubit>(context);
        return HomeCubit(authenticationCubit)..init();
      },
      child: const HomeScreen(),
    );
  }
}

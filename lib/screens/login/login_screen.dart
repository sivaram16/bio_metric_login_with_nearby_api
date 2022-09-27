import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_demo/screens/login/cubit/login_cubit.dart';
import 'package:freelance_demo/widgets/custom_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: _Layout(),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: cubit.loginWithBioMetrics,
            child: const Text("Login"),
          ),
        )
      ],
    );
  }
}

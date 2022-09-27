import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_demo/http/model/petronas_data.dart';
import 'package:freelance_demo/screens/home/cubit/home_cubit.dart';
import 'package:freelance_demo/screens/home/cubit/home_state.dart';
import 'package:freelance_demo/utils/app_utils.dart';
import 'package:freelance_demo/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Freelance Demo",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocListener(
        bloc: cubit,
        listener: (context, state) {
          if (state is HomeErrorState) {
            AppUtils.showToast(state.error, color: Colors.red);
          }
        },
        child: const _Layout(),
      ),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final isLoading =
        context.select((HomeCubit cubit) => cubit.state is HomeLoadingState);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16, top: 10),
          child: Row(
            children: [
              Expanded(child: Container()),
              InkWell(
                  onTap: cubit.authenticationCubit.logout,
                  child: const Icon(Icons.exit_to_app))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            "Petronas",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        if (cubit.petronasData.isEmpty)
          Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              child: const Center(
                  child: Text(
                "No data found",
                style: TextStyle(
                  fontSize: 18,
                ),
              )))
        else
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemCount: cubit.petronasData.length,
                  separatorBuilder: ((context, index) => const Divider()),
                  itemBuilder: (context, index) {
                    return _ListItem(cubit.petronasData[index]);
                  }),
            ),
          ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final PetronasData petronasData;
  const _ListItem(this.petronasData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(petronasData.icon!),
      title: Text(petronasData.name!),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Rating : ${petronasData.rating.toString()}"),
        Text(petronasData.vicinity.toString()),
      ]),
    );
  }
}

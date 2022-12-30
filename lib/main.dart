import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:test_bloc_app/logic/cubit/internet_cubit.dart';
import 'package:test_bloc_app/presentation/router/app_router.dart';

void main() {
  runApp(RepositoryProvider<AppRouter>(
    create: (context) => AppRouter(),
    child: MyApp(
      connectivity: Connectivity(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        color: Colors.blueGrey,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        onGenerateRoute:
            RepositoryProvider.of<AppRouter>(context).onGenerateRoute,
      ),
    );
  }
}

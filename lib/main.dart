import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_bloc_app/logic/Utility/bloc_observer.dart';
import 'package:test_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:test_bloc_app/logic/cubit/internet_cubit.dart';
import 'package:test_bloc_app/logic/cubit/settings_cubit.dart';
import 'package:test_bloc_app/logic/cubit/testu_cubit.dart';
import 'package:test_bloc_app/presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocobserver();

  runApp(RepositoryProvider<AppRouter>(
    create: (context) => AppRouter(),
    child: MyApp(
      connectivity: Connectivity(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  MyApp({required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
        BlocProvider<TestuCubit>(create: (context) => TestuCubit()),
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

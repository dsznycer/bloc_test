import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:test_bloc_app/presentation/screens/home_screen.dart';
import 'package:test_bloc_app/presentation/screens/second_screen.dart';

class AppRouter {
  CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _counterCubit,
                  child: HomeScreen(color: Colors.red, text: 'Home Screen'),
                ));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _counterCubit,
                  child:
                      SecondScreen(color: Colors.green, text: 'Second Screen'),
                ));
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(color: Colors.green, text: 'Third Screen'),
          ),
        );
        break;
      default:
        return null!;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:test_bloc_app/presentation/screens/home_screen.dart';
import 'package:test_bloc_app/presentation/screens/second_screen.dart';
import 'package:test_bloc_app/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) =>
                HomeScreen(color: Colors.red, text: 'Home Screen'));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (context) =>
                SecondScreen(color: Colors.green, text: 'Second Screen'));
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (context) =>
              ThirdScreen(color: Colors.blue, text: 'Third Screen'),
        );
        break;
      default:
        return null!;
    }
  }
}

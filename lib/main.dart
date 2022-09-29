import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:test_bloc_app/presentation/router/app_router.dart';
import 'package:test_bloc_app/presentation/screens/home_screen.dart';
import 'package:test_bloc_app/presentation/screens/second_screen.dart';
import 'package:test_bloc_app/presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blueGrey,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:test_bloc_app/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blueGrey,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: HomeScreen(
          color: Colors.red,
          text: 'FIRST SCREEN',
        ),
      ),
    );
  }
}

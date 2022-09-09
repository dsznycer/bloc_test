import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        color: Colors.blueGrey,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WITAM W CUBIT WROLD'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('TYLE RAZY TO BYŁO PUSZNIĘTE:'),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  "UUUU MINUSIKKK  " + state.counterValue.toString(),
                  style: TextStyle(fontSize: 20),
                );
              } else if (state.counterValue == 0) {
                return Text(
                  "MNIEJ NIŻ ZEROOOOO   " + state.counterValue.toString(),
                  style: TextStyle(fontSize: 20),
                );
              } else {
                return Text(
                  "UUUU PLUSIKKK  " + state.counterValue.toString(),
                  style: TextStyle(fontSize: 20),
                );
              }
              ;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).zeroShit();
                },
                child: Icon(Icons.exposure_zero),
              ),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}

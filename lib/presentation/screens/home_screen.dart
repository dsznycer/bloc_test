import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/constants/enums.dart';
import 'package:test_bloc_app/logic/cubit/internet_cubit.dart';
import 'package:test_bloc_app/presentation/screens/second_screen.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  Color color;
  String text;

  HomeScreen({required this.color, required this.text, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('DODANOO'),
                duration: Duration(seconds: 1),
              ),
            );
          } else if (state.isIncremented == false) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('ODJĘTOOO'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text(
                    "Connected to mobile",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    "Connected to WIFI",
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    "Disconnected",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
              Builder(
                builder: (context) {
                  final counterValue = context
                      .select((CounterCubit cubit) => cubit.state.counterValue);
                  return Text(counterValue.toString());
                },
              ),
              Builder(builder: (context) {
                final state = context.watch<InternetCubit>().state;
                final counterState = context.watch<CounterCubit>().state;

                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text(
                    textAlign: TextAlign.center,
                    'TYLE RAZY PUSZNIĘTE: ${counterState.counterValue} a state is Internet Connected to mobile',
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    'TYLE RAZY PUSZNIĘTE: ${counterState.counterValue} a state is Internet Connected to wifi         ',
                  );
                } else if (state is InternetDisconnected) {
                  Text(
                    textAlign: TextAlign.center,
                    'TYLE RAZY PUSZNIĘTE: ${counterState.counterValue} a state is kurwa disconnected}',
                  );
                }

                return CircularProgressIndicator();
              }),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      "UUUU MINUSIKKK  " + state.counterValue.toString(),
                      style: TextStyle(fontSize: 20),
                    );
                  } else if (state.counterValue == 0) {
                    return Text(
                      "MNIEJ NIŻ ZEROOO   " + state.counterValue.toString(),
                      style: TextStyle(fontSize: 20),
                    );
                  } else {
                    return Text(
                      "Jesteś na plus!   " + state.counterValue.toString(),
                      style: TextStyle(fontSize: 20),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FloatingActionButton(
                    heroTag: 126,
                    onPressed: () {
                      context.read<CounterCubit>().zeroShit();
                    },
                    child: Icon(Icons.exposure_zero),
                  ),
                  FloatingActionButton(
                    heroTag: 125,
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 124,
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  )
                ],
              ),
              MaterialButton(
                  color: widget.color,
                  child: Text('Second Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  }),
              MaterialButton(
                  color: widget.color,
                  child: Text('Third Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/third');
                  })
            ],
          ),
        ),
      ),
    );
  }
}

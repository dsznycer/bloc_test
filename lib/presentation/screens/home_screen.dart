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
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetDisconnected) {
          BlocProvider.of<CounterCubit>(context).decrement();
          // BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
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
                      style: Theme.of(context).textTheme.headline3,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
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
      ),
    );
  }
}

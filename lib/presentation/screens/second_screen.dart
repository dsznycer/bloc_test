import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/logic/cubit/settings_cubit.dart';
import 'package:test_bloc_app/logic/cubit/testu_cubit.dart';
import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  Color color;
  String text;

  SecondScreen({required this.color, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(context.watch<TestuCubit>().state.text),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('This was pushed:'),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  "You are under " + state.counterValue.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              } else if (state.counterValue == 0) {
                return Text(
                  "Equal zero " + state.counterValue.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              } else {
                return Text(
                  "You are on plus " + state.counterValue.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              }
              ;
            },
          ),
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
            if (state is SettingsUnique) {
              return Container(
                height: 100,
                width: 100,
                color: state.color,
                child: const Text(
                  'This box show state color',
                  maxLines: 3,
                  style:
                      TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
                ),
              );
            } else {
              return Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: const Text('Elo'),
              );
            }
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingActionButton(
                heroTag: 126,
                onPressed: () {
                  context.read<CounterCubit>().zeroShit();
                },
                child: const Icon(Icons.exposure_zero),
              ),
              FloatingActionButton(
                heroTag: 125,
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: 124,
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              )
            ],
          ),
          FloatingActionButton(
              heroTag: 123,
              focusColor: color,
              child: Icon(Icons.arrow_back),
              onPressed: (() => Navigator.of(context).pop())),
          MaterialButton(
              color: Colors.pink,
              child: const Text('To small '),
              onPressed: () => context.read<TestuCubit>().changeSmall()),
        ],
      ),
    );
  }
}

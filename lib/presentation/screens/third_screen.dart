import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/presentation/screens/second_screen.dart';
import '../../logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  Color color;
  String text;

  ThirdScreen({required this.color, required this.text, super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.text),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('This was pushed this many times:'),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  "You are under  " + state.counterValue.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              } else if (state.counterValue == 0) {
                return Text(
                  "Zero  " + state.counterValue.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              } else {
                return Text(
                  "Jesteś na plus!   " + state.counterValue.toString(),
                  style: const TextStyle(fontSize: 20),
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
                  context.read<CounterCubit>().zeroShit();
                },
                child: const Icon(Icons.exposure_zero),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              )
            ],
          ),
          MaterialButton(
              color: widget.color,
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}

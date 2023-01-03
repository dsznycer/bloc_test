import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  Color color;
  String text;

  SecondScreen({required this.color, required this.text, super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
              ;
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
          FloatingActionButton(
              heroTag: 123,
              focusColor: widget.color,
              onPressed: (() => Navigator.of(context).pop())),
        ],
      ),
    );
  }
}

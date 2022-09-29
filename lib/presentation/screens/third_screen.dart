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
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('DODANOO'),
              duration: Duration(seconds: 1),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('ODJĘTOOO'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        child: Column(
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
            ),
            MaterialButton(
                color: widget.color,
                child: Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}

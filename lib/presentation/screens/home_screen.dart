import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/constants/enums.dart';
import 'package:test_bloc_app/logic/cubit/internet_cubit.dart';
import 'package:test_bloc_app/logic/cubit/settings_cubit.dart';
import 'package:test_bloc_app/logic/cubit/testu_cubit.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  Color color;
  String text;

  HomeScreen({required this.color, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final value =
        context.select((CounterCubit bloc) => bloc.state.counterValue);

    return Scaffold(
      appBar: AppBar(
          title:
              Text((context.watch<TestuCubit>().state.text) + value.toString()),
          backgroundColor: Colors.amber),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('DODANOO'),
                duration: Duration(seconds: 1),
              ),
            );
          } else if (state.isIncremented == false) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                  return const CircularProgressIndicator();
                }
              }),
              Builder(builder: (context) {
                final state = context.watch<InternetCubit>().state;
                final counterState = context.watch<CounterCubit>().state;

                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text(
                    textAlign: TextAlign.center,
                    'This was pushed: ${counterState.counterValue} a state is Internet Connected to mobile',
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    'This was pushed: ${counterState.counterValue} a state is Internet Connected to wifi         ',
                  );
                } else if (state is InternetDisconnected) {
                  Text(
                    textAlign: TextAlign.center,
                    'This was pushed: ${counterState.counterValue} a state is kurwa disconnected}',
                  );
                }

                return const CircularProgressIndicator();
              }),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      "You are under  " + state.counterValue.toString(),
                      style: const TextStyle(fontSize: 20),
                    );
                  } else if (state.counterValue == 0) {
                    return Text(
                      "Less than zero  " + state.counterValue.toString(),
                      style: const TextStyle(fontSize: 20),
                    );
                  } else {
                    return Text(
                      "On the plus side!  " + state.counterValue.toString(),
                      style: const TextStyle(fontSize: 20),
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
              MaterialButton(
                  color: color,
                  child: const Text('Second Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  }),
              MaterialButton(
                  color: color,
                  child: const Text('Third Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/third');
                  }),
              MaterialButton(
                  color: Colors.amber,
                  child: const Text('Change to Blue'),
                  onPressed: () {
                    context.read<SettingsCubit>().toBlue();
                  }),
              BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                if (state is SettingsUnique) {
                  return MaterialButton(
                      color: state.color,
                      child: const Text('Change to Pink'),
                      onPressed: () {
                        context.read<SettingsCubit>().toPink();
                      });
                } else {
                  return MaterialButton(
                      color: Colors.amber,
                      child: const Text('Change to Pink'),
                      onPressed: () {
                        context.read<SettingsCubit>().toPink();
                      });
                }
              }),
              MaterialButton(
                  color: Colors.amber,
                  child: const Text('Change to BIG'),
                  onPressed: () {
                    context.read<TestuCubit>().changeBig();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

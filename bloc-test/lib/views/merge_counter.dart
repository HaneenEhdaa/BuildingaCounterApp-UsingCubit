import 'package:bloc_test/views/builder_view.dart';
import 'package:bloc_test/views/listener_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/cubits/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenerWidget(
      mychild: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 28, 172, 146),
          title: const Text("Counter App"),
        ),
        body: Center(
          child: const BuilderWidget(),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBlocCubit>().inc();
                },
                tooltip: 'Increment',
                heroTag: "Increment",
                backgroundColor: const Color.fromARGB(255, 210, 255, 247),
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 100),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBlocCubit>().dec();
                },
                tooltip: 'Decrement',
                heroTag: "Decrement",
                backgroundColor: const Color.fromARGB(255, 210, 255, 247),
                child: const Icon(Icons.minimize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

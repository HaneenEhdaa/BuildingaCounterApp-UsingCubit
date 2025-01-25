import 'package:bloc_test/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsumerView extends StatefulWidget {
  const ConsumerView({super.key});

  @override
  State<ConsumerView> createState() => _ConsumerViewState();
}

class _ConsumerViewState extends State<ConsumerView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBlocCubit, CounterBlocState>(
      listener: (context, state) {
        if (state.num == 10 || state.num == -10) {
          showSuccessDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 28, 172, 146),
            title: Text("Consumer Counter App"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 28, 172, 146),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${state.num}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
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
                SizedBox(width: 100),
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
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: const Text(
            "Note!",
            style: TextStyle(
              color: const Color.fromARGB(255, 28, 172, 146),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text("The counter reaches a negative value"),
          actions: [
            Icon(
              Icons.notifications_none_outlined,
              color: Color.fromARGB(255, 28, 172, 146),
              size: 60,
            ),
          ],
        );
      },
    );
  }
}

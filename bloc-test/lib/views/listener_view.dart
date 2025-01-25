import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/cubits/counter_cubit.dart';

class ListenerWidget extends StatelessWidget {
  final Widget mychild;

  const ListenerWidget({super.key, required this.mychild});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBlocCubit, CounterBlocState>(
      listener: (context, state) {
        if (state.num < 0) {
          showSuccessDialog(context);
        }
      },
      child: mychild,
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

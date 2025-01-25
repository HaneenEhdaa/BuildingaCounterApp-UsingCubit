import 'package:bloc_test/cubits/counter_cubit.dart';
import 'package:bloc_test/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterBlocCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    ),
  );
}

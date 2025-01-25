import 'package:bloc_test/views/merge_counter.dart';
import 'package:bloc_test/views/consumer_view.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 28, 172, 146),
              fontWeight: FontWeight.w300),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CounterPage()));
                },
                child: Text(
                  "Listner & Builder",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 28, 172, 146),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConsumerView()));
                },
                child: Text(
                  "Consumer",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 28, 172, 146),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}

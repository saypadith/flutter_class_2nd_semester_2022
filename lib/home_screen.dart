import 'package:flutter/material.dart';
import 'package:flutter_ceit/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.amber,
                child: const Center(
                  child: Text("Box A"),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
                child: const Center(
                  child: Text("Box B"),
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            height: 150,
            color: Colors.green,
            child: const Center(
              child: Text("Box C"),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text("Box d"),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.purple,
                child: const Center(
                  child: Text("Box e"),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: const Center(
                  child: Text("Box f"),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ),
              );
            },
            child: const Text("Second Screen"),
          ),
        ],
      ),
    );
  }
}

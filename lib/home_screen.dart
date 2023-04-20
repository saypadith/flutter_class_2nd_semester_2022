import 'package:flutter/material.dart';
import 'package:flutter_ceit/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ໜ້າຫຼັກ"),
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
                child: Center(
                  child: const Text("Box A"),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
                child: Center(
                  child: const Text("Box B"),
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            height: 150,
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48),
                bottomRight: Radius.circular(48),
              ),
            ),
            child: Center(
              child: const Text("Box C"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.purple,
                child: Center(
                  child: const Text("Box D"),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.pink,
                child: Center(
                  child: const Text("Box E"),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                  child: const Text("Box F"),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            child: const Text("Second Screen"),
          )
        ],
      ),
    );
  }
}

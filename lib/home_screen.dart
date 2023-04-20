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
                height: 100,
                color: Colors.amber,
                child: const Center(
                  child: Text("Box A"),
                ),
              ),
              Container(
                width: 150,
                height: 100,
                color: Colors.green,
                child: const Center(
                  child: Text("Box B"),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(48),
            width: 300,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48),
                bottomRight: Radius.circular(48),
              ),
            ),
            child: const Center(
              child: Text("Box C"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text("Box D"),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.purple,
                child: const Center(
                  child: Text("Box E"),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.blueGrey,
                child: const Center(
                  child: Text("Box F"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Center(child: Text("Sign in with:")),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 48),
            // color: Colors.indigo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.facebook,
                  size: 48,
                ),
                Icon(
                  Icons.person,
                  size: 48,
                ),
                Icon(
                  Icons.settings,
                  size: 48,
                ),
              ],
            ),
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
          )
        ],
      ),
    );
  }
}

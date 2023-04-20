import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
                color: Colors.red,
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
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48),
                bottomRight: Radius.circular(48),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: const Text("Box C"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 150,
                color: Colors.purple,
                child: Center(
                  child: const Text("Box D"),
                ),
              ),
              Container(
                width: 100,
                height: 150,
                color: Colors.grey,
                child: Center(
                  child: const Text("Box E"),
                ),
              ),
              Container(
                width: 100,
                height: 150,
                color: Colors.pink,
                child: Center(
                  child: const Text("Box F"),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 34,
          // ),
          // Container(
          //   margin: EdgeInsets.only(left: 34, right: 34),
          //   // color: Colors.amber,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Icon(Icons.facebook, size: 48),
          //       Icon(Icons.settings, size: 48),
          //       Icon(Icons.people, size: 48)
          //     ],
          //   ),
          // ),
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

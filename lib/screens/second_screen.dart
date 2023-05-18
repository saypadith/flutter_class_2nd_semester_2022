import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  // create dummy list of Lao students
  final List<String> students = [
    "Sengmany",
    "Sengphet",
    "Sengsoury",
    "Sengsavang",
    "Sengthong",
    "Sengphet",
    "Sengsoury",
    "Sengsavang",
    "Sengphet",
    "Sengsoury",
    "Sengsavang",
    "Sengphet",
    "Sengsoury",
    "Sengsavang",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack")),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                          "https://picsum.photos/id/213/400/250")),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        "10,000 KIP",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print(students[index]);
                      },
                      leading: Image.network(
                          "https://picsum.photos/id/${index + 30}/100/100"),
                      title: Text(students[index]),
                      subtitle: const Text("Lao student"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

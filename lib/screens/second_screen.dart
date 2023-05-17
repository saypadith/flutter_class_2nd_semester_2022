import 'package:flutter/material.dart';

class Student {
  final String name;
  final String image;

  Student({required this.name, required this.image});
}

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final List<Map<String, String>> studentList = [
    {"name": "Mr. Johnny", "image": "https://picsum.photos/id/157/100/100"},
    {"name": "Ms. Jane", "image": "https://picsum.photos/id/158/100/100"},
    {"name": "Mr. Bob", "image": "https://picsum.photos/id/159/100/100"},
    {"name": "Ms. Alice", "image": "https://picsum.photos/id/160/100/100"},
    {"name": "Mr. Smith", "image": "https://picsum.photos/id/161/100/100"},
    {"name": "Mr. Bob", "image": "https://picsum.photos/id/159/100/100"},
    {"name": "Ms. Alice", "image": "https://picsum.photos/id/160/100/100"},
    {"name": "Mr. Smith", "image": "https://picsum.photos/id/161/100/100"},
    {"name": "Mr. Bob", "image": "https://picsum.photos/id/159/100/100"},
    {"name": "Ms. Alice", "image": "https://picsum.photos/id/160/100/100"},
    {"name": "Mr. Smith", "image": "https://picsum.photos/id/161/100/100"},
    {"name": "Mr. Bob", "image": "https://picsum.photos/id/159/100/100"},
    {"name": "Ms. Alice", "image": "https://picsum.photos/id/160/100/100"},
    {"name": "Mr. Smith", "image": "https://picsum.photos/id/161/100/100"},
    {"name": "Mr. Bob", "image": "https://picsum.photos/id/159/100/100"},
    {"name": "Ms. Alice", "image": "https://picsum.photos/id/160/100/100"},
    {"name": "Mr. Smith", "image": "https://picsum.photos/id/161/100/100"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack")),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                          "https://picsum.photos/id/157/400/250")),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        "15,000 KIP",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          child: ClipOval(
                        child: Image.network(studentList[index]["image"]!),
                      )),
                      title: Text(studentList[index]["name"]!),
                      subtitle: Text("Student"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

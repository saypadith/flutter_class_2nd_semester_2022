import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack")),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network("https://picsum.photos/id/157/400/250")),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      ),
    );
  }
}

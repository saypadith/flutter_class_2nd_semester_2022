import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isFavorite = false;

  getFavorite() async {
    // get favorite data from sharepreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool("isFavorite") ?? false;
    });
  }

  setFavorite() async {
    // set favorite data to sharepreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFavorite", !isFavorite);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    getFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network("https://picsum.photos/id/124/400/250")),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black26,
                ),
                child: const Text(
                  "10,000 KIP",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setFavorite();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

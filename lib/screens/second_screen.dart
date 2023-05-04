import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool? _isFavorite;

  getFavorite() async {
    // get  from sharepreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = prefs.getBool("isFavorite") ?? false;
    });
  }

  setFavorite() async {
    // set to sharepreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFavorite", _isFavorite!);
  }

  @override
  void initState() {
    // TODO: implement initState
    getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text("second home"),
            Stack(
              children: [
                Image.network(
                  "https://picsum.photos/id/231/400/300",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      "SABAIDEE",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite!;
                        setFavorite();
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: _isFavorite! ? Colors.red : Colors.white,
                      size: 38,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

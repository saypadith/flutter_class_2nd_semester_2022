import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool? _isFavorite;
  // create dummy list of student name
  List<String> studentName = [
    "Johny",
    "Somsak",
    "Somsri",
    "Somsong",
    "Somchai",
    "Somrak",
    "Sompong",
  ];

  // create dummy list of student name, generated random telephone number and image from picsum
  List<Map<String, dynamic>> studentList = [
    {
      "name": "Johny",
      "tel": "0812345678",
      "image": "https://picsum.photos/id/1/200/200"
    },
    {
      "name": "Somsak",
      "tel": "0812345678",
      "image": "https://picsum.photos/id/2/200/200"
    },
    {
      "name": "Somsri",
      "tel": "0812345678",
      "image": "https://picsum.photos/id/3/200/200"
    },
    {
      "name": "Somsong",
      "tel": "0812345678",
      "image": "https://picsum.photos/id/4/200/200"
    },
    {
      "name": "Somchai",
      "tel": "0812345678",
      "image": "https://picsum.photos/id/5/200/200"
    },
    {
      "name": "Somrak",
      "tel": "0812345678",
      "image": "https://picsum.photos/id/6/200/200"
    },
    {
      "name": "Sompong",
      "tel": "0812345678",
      "image": "https://picsum.photos/id/7/200/200"
    },
  ];

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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Text("second home"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThirdScreen();
                    }));
                  },
                  child: Text("3rd screen")),
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
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 400,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: studentName.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         onTap: () {
              //           print(studentName[index]);
              //         },
              //         leading: CircleAvatar(
              //           backgroundImage: NetworkImage(
              //               "https://picsum.photos/id/${index + 10}/200/200"),
              //         ),
              //         title: Text(studentName[index]),
              //         subtitle: Text("Student"),
              //       );
              //     },
              //   ),
              // ),
              Container(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print(studentList[index]["name"]);
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            studentList[index]["image"].toString()),
                      ),
                      title: Text(studentList[index]["name"].toString()),
                      subtitle: Text(studentList[index]["tel"].toString()),
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

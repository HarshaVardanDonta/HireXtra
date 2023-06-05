// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'screens/WeatherScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WeatherScreen(),
    );
  }
}

class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  TextEditingController _emailC = TextEditingController();
  TextEditingController _passC1 = TextEditingController();
  TextEditingController _passC2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.cyan.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: TextFormField(
                    controller: _emailC,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "e-mail"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.cyan.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: TextFormField(
                    controller: _passC1,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "password"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.cyan.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: TextFormField(
                    controller: _passC2,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "repeat password"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    Text("Remember Me"),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "Sign Up with social account",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.cyan]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "Read user license agreement",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.cyan),
            ),
          ),
        ],
      ),
    );
  }
}

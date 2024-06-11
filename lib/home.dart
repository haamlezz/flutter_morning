import 'package:flutter/material.dart';
import 'package:morning_app/about.dart';
import 'package:morning_app/detail.dart';
import 'package:morning_app/form_add.dart';
import 'package:morning_app/product_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          const Text("Welcome"),
          const Text("To"),
          const Text("My First App"),
          Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Text("A"),
                Text("B"),
                Text("C"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
            },
            child: const Text("Go to About"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Detail(),
                ),
              );
            },
            child: const Text("Go to Detail"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(),
                ),
              );
            },
            child: const Text("Go to Product"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormAdd(),
                ),
              );
            },
            child: const Text("Add Product"),
          ),
        ],
      ),
    );
  }
}

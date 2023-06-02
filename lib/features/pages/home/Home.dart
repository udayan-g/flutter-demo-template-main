import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'dart:async';
import 'package:demo/features/pages/home/addDevice.Dart';
//import 'dart:io';
import 'package:demo/features/pages/home/PH.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle menu button press
              },
            ),
          ],
        ),
        centerTitle: true,
        title: const Text(
          'XopunYantra',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 122, 65, 228),
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => Add()),
              );
            },
          ),
        ],
        elevation: 0.00,
        backgroundColor: Color.fromARGB(255, 172, 172, 172),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Container(
          width: 250.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => GraphScreen()),
                );
              },
              child: const Text(
                'PH',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 249, 251),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

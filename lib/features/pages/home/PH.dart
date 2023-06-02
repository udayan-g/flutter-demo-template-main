import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'dataservices.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  List data = [];

  Future<void> getdata() async {
    final response = await dataService.getPhData();
    Map<String, dynamic> phdata = response.data;
    phdata.forEach((key, value) {
      for (var i in value) {
        data.add(i);
      }
    });
  }

  final dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PH Data'),
        ),
        body: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text(
                  "Data is shown below ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
              return Column(
                children: [
                  ...data.map((e) {
                    return Text("${e['attributes']['phvalue']}");
                  })
                ],
              );
            }));
  }
}

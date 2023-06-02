import 'package:flutter/services.dart';

import 'package:flutter/material.dart';


class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final TextEditingController _ssidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _resultMessage = '';

  Future<void> _connectToWifi() async {
    String ssid = _ssidController.text;
    String password = _passwordController.text;

    bool? isConnected = await WifiUtils.connectToWifi(ssid, password);

    setState(() {
      if (isConnected != null && isConnected) {
        _resultMessage = 'Connected to Wi-Fi successfully!';
      } else {
        _resultMessage = 'Failed to connect to Wi-Fi.';
      }
    });
  }

  @override
  void dispose() {
    _ssidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect to Wi-Fi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ssidController,
              decoration: InputDecoration(
                labelText: 'Wi-Fi SSID',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Wi-Fi Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _connectToWifi,
              child: Text('Connect'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultMessage,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

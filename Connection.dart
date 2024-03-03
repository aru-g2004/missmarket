
import 'package:flutter/material.dart';

class NotConnected extends StatefulWidget {
  @override
  _NotConnectedState createState() => _NotConnectedState();
}

class _NotConnectedState extends State<NotConnected> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue[100], //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 100,
              height: 100,
              image: AssetImage(
                ""
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
            ),
            Text('Wifi is not connected',
                style: TextStyle(color: Colors.blue[900])),
            Text('Connect and try again!',
                style: TextStyle(
                  color: Colors.blue[900],
                )),
            SizedBox(
              height: 100,
              width: 100,
            ),
            Center(child: Icon(Icons.wifi_off)),
            SizedBox(
              height: 100,
              width: 100,
            ),
            Center(child: CircularProgressIndicator())
          ],
        ));
  }
}
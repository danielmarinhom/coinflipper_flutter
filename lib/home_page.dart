import 'dart:math';
import 'models/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  void changeImage() {
    setState(() {
      changeImg();
    });
  }

  void updateSelected(int index) {
    setState(() {
      selected = values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Coin Flipper')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //IMAGE
            Container(
              color: Colors.transparent,
              child: Image.asset(imgUrl, width: 300, height: 300),
            ),
            //PICKER
            SizedBox(height: 20),
            CupertinoPicker(
              itemExtent: 40,
              onSelectedItemChanged: (index) {
                updateSelected(index);
              },
              children: [Text('Heads'), Text('Tails')],
            ),
            //TEXT
            SizedBox(height: 30),
            Text(text, style: TextStyle(fontSize: 24, color: textColor)),
            //BUTTON
            SizedBox(height: 20),
            ElevatedButton(onPressed: changeImage, child: Text('Flip'))
          ],
        ));
  }
}

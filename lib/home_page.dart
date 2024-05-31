import 'dart:math';
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
  List<String> values = ['heads', 'tails'];
  String selected = 'heads';
  String side = '';
  String text = '';
  String imgUrl = 'assets/images/empty.png';
  Color textColor = Colors.black;
  final Random _random = Random();

  String sortSide() {
    int _index = _random.nextInt(2);
    side = values[_index];
    return values[_index];
  }

  String getUrl(String side) {
    return 'assets/images/$side.png';
  }

  void changeImg() {
    setState(() {
      side = sortSide();
      imgUrl = getUrl(side);
      verifyWin();
    });
  }
  void verifyWin(){
    if(selected == side){
      text = 'Win';
      textColor = Colors.green;
    }else{
      text = 'Lose';
      textColor = Colors.red;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Coin Flipper')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //IMAGE
            Image.asset(imgUrl, width: 100, height: 100),
            //PICKER
            SizedBox(height: 20),
            CupertinoPicker(
              itemExtent: 40,
              onSelectedItemChanged: (index) {
                setState(() {
                  selected = ['Heads', 'Tails'][index].toLowerCase();
                });
              },
              children: [Text('Heads'), Text('Tails')],
            ),
            //TEXT
            SizedBox(height:30),
            Text(text, style: TextStyle(fontSize: 24, color: textColor)),
            //BUTTON
            SizedBox(height: 20),
            ElevatedButton(onPressed: changeImg, child: Text('Flip'))
          ],
        ));
  }
}

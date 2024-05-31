import 'dart:math';
import 'package:flutter/material.dart';

List<String> values = ['heads', 'tails'];
String selected = 'heads';
String side = '';
String text = '';
String imgUrl = 'assets/images/heads.png';
Color textColor = Colors.black;
final Random _random = Random();

void sortSide() {
  int index = _random.nextInt(2);
  side = values[index];
}

String getUrl(String side) {
  return 'assets/images/$side.png';
}

void changeImg() {
  sortSide();
  imgUrl = getUrl(side);
  verifyWin();
}

void verifyWin() {
  if (selected == side) {
    text = 'Win';
    textColor = Colors.green;
  } else {
    text = 'Lose';
    textColor = Colors.red;
  }
}

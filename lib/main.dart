import 'package:flutter/material.dart';

import 'screen/home_screen/home_screen_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: false),
    debugShowCheckedModeBanner: false,
    home: const BmiCalculator(),
  ));
}

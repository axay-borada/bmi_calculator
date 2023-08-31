import 'package:bmi_calculator/screen/home_screen/home_page_widget.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int? selectedIndex;
  double finalResult = 0;
  String bmi = '';
  double result = 0;
  bool? list;
  bool value1 = false;
  bool value2 = true;
  String? select;
  String? select1;
  double count = 0;
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void onPressed() {
    ageController.clear();
    heightController.clear();
    weightController.clear();
    bmi = '';
    result = 0;
  }

  void onChanged(value) {
    setState(() {
      select = value;
    });
  }

  void onChanged1(value1) {
    select1 = value1;
    setState(() {});
  }

  void onIconChanged(value) {
    setState(() {
      value1 = value2;
      value2 = !value1;
      value = !value2;
    });
  }

  Future<void> calculatorMan() async {
    int age = int.parse(ageController.text);
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    if ((ageController.toString().isNotEmpty && age > 0) &&
        (weightController.toString().isNotEmpty && weight > 0) &&
        (heightController.toString().isNotEmpty && height > 0)) {
      result = (weight / height / height) * 10000;
    }
    if (result <= 15.9) {
      bmi = 'Very Severely Underweight';
      selectedIndex = 0;
    } else if (result >= 16 && result <= 16.9) {
      bmi = 'Very Severely Underweight';
      selectedIndex = 1;
    } else if (result >= 17 && result <= 18.4) {
      bmi = 'Underweight';
      selectedIndex = 2;
    } else if (result >= 18.5 && result <= 24.9) {
      bmi = "Normal";
      selectedIndex = 3;
    } else if (result >= 25 && result <= 29.9) {
      bmi = 'Overweight';
      selectedIndex = 4;
    } else if (result >= 30 && result <= 34.9) {
      bmi = 'Obese Class |';
      selectedIndex = 5;
    } else if (result >= 35.0 && result <= 39.9) {
      bmi = 'Obese Class ||';
      selectedIndex = 6;
    } else if (result >= 40) {
      bmi = 'Obese Class |||';
      selectedIndex = 7;
    }

    double value = result;
    for (double i = 0; i < value; i++) {
      await Future.delayed(
        const Duration(microseconds: 10000),
        () {
          setState(() {
            finalResult = i;
          });
        },
      );
    }
    setState(() {});
  }

  Future<void> calculatorWomen() async {
    int age = int.parse(ageController.text);
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    if ((ageController.toString().isNotEmpty && age > 0) ||
        (weightController.toString().isNotEmpty && weight > 0) ||
        (heightController.toString().isNotEmpty && height > 0)) {
      result = (weight / height / height) * 10000;
    }
    if (result <= 13.9) {
      bmi = 'Very Severely Underweight';
      selectedIndex = 0;
    } else if (result >= 14.0 && result <= 15.9) {
      bmi = 'Very Severely Underweight';
      selectedIndex = 1;
    } else if (result >= 16.0 && result <= 17.4) {
      bmi = 'Underweight';
      selectedIndex = 2;
    } else if (result >= 17.5 && result <= 23.9) {
      bmi = "Normal";
      selectedIndex = 3;
    } else if (result >= 24 && result <= 28.9) {
      bmi = 'Overweight';
      selectedIndex = 4;
    } else if (result >= 29 && result <= 33.9) {
      bmi = 'Obese Class |';
      selectedIndex = 5;
    } else if (result >= 34 && result <= 38.9) {
      bmi = 'Obese Class ||';
      selectedIndex = 6;
    } else if (result >= 40) {
      bmi = 'Obese Class |||';
      selectedIndex = 7;
    }
    double value = result;
    for (double i = 0; i < value; i++) {
      await Future.delayed(
        const Duration(microseconds: 100),
        () {
          setState(() {
            finalResult = i;
          });
        },
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(onPressed),
      body: Column(
        children: [
          bodyRow1(onChanged, select, ageController, heightController),
          bodyRow2(value1, onIconChanged, value2, onChanged1, select1,
              weightController),
          row3(finalResult),
          row4(bmi: bmi, result: result),
          value1 ? listWoman(selectedIndex) : listMan(selectedIndex),
          button(
            () => value1 ? calculatorWomen() : calculatorMan(),
          ),
        ],
      ),
    );
  }
}

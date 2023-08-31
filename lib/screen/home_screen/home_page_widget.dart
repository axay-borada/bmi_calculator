import 'package:bmi_calculator/utils/color_res.dart';
import 'package:bmi_calculator/utils/data_res.dart';
import 'package:bmi_calculator/utils/icon_res.dart';
import 'package:bmi_calculator/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

AppBar homePageAppBar(Function() onPressed) {
  return AppBar(
    backgroundColor: ColorsRes.black45,
    title: const Text(
      StringRes.title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(onPressed: onPressed, icon: const Icon(IconsRes.rotate)),
      const SizedBox(width: 20),
      const Icon(IconsRes.more),
      const SizedBox(width: 20)
    ],
  );
}

Widget textField(
  String? hintText,
  String? labelText,
  TextEditingController? controller,
) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          contentPadding: const EdgeInsets.only(left: 35),
        ),
      ),
    ),
  );
}

Widget bodyRow1(
  Function(String?) onChanged,
  String? value,
  TextEditingController ageController,
  TextEditingController heightController,
) {
  return Row(
    children: [
      textField(
        StringRes.age,
        StringRes.age,
        ageController,
      ),
      textField(
        StringRes.height,
        StringRes.height,
        heightController,
      ),
      DropdownButton<String>(
          underline: const SizedBox(),
          hint: const Text(StringRes.select),
          style: const TextStyle(fontSize: 19, color: ColorsRes.black),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          alignment: Alignment.center,
          value: value,
          items: const <DropdownMenuItem<String>>[
            DropdownMenuItem(
              value: StringRes.cm,
              child: Text(StringRes.cm),
            ),
            DropdownMenuItem(
              value: StringRes.ft,
              child: Text(StringRes.ft),
            )
          ],
          onChanged: onChanged)
    ],
  );
}

Widget bodyRow2(
    bool off,
    Function(bool?) onChanged,
    bool on,
    Function(String?) onChanged2,
    String? value1,
    TextEditingController weightController) {
  return Row(
    children: [
      InkWell(
        onTap: () => onChanged(off),
        child: Icon(
          IconsRes.women,
          size: 45,
          color: off ? ColorsRes.orangeColor : null,
        ),
      ),
      Container(
        height: 40,
        width: 0.8,
        color: ColorsRes.black45,
      ),
      InkWell(
        onTap: () => (onChanged(on)),
        child: Icon(
          IconsRes.men,
          size: 45,
          color: on ? ColorsRes.orangeColor : null,
        ),
      ),
      textField(
        StringRes.weight,
        StringRes.weight,
        weightController,
      ),
      DropdownButton<String>(
          underline: const SizedBox(),
          style: const TextStyle(fontSize: 19, color: ColorsRes.black),
          hint: const Text(StringRes.select),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          alignment: Alignment.center,
          value: value1,
          items: const <DropdownMenuItem<String>>[
            DropdownMenuItem(
              value: StringRes.kg,
              child: Text(StringRes.kg),
            ),
            DropdownMenuItem(
              value: StringRes.lb,
              child: Text(StringRes.lb),
            ),
            DropdownMenuItem(
              value: StringRes.st,
              child: Text(StringRes.st),
            ),
          ],
          onChanged: onChanged2)
    ],
  );
}

Widget listMan(
  int? selectedIndex,
) {
  return Expanded(
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: DataRes.data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            color: selectedIndex != null && selectedIndex == index
                ? ColorsRes.redColor : Colors.transparent,
            child: Row(
              children: [
                Text(
                  DataRes.data[index]["name"],
                  style: const TextStyle(fontSize: 17),
                ),
                const Spacer(),
                Text(
                  DataRes.data[index]['status'],
                  style: const TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget listWoman(
  int? selectedIndex,
) {
  return Expanded(
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: DataRes.data1.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            color: selectedIndex != null && selectedIndex == index
                ? ColorsRes.redColor
                : Colors.transparent,
            child: Row(
              children: [
                Text(
                  DataRes.data1[index]['name'],
                  style: const TextStyle(fontSize: 17),
                ),
                const Spacer(),
                Text(
                  DataRes.data1[index]['status'],
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget button(Function() calculator) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 20,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              padding: const EdgeInsets.only(
                  right: 45, left: 45, top: 5, bottom: 5)),
          onPressed: calculator,
          child: const Text(
            StringRes.submit,
            style: TextStyle(fontSize: 21, letterSpacing: 2),
          ),
        ),
      ),
    ],
  );
}

Widget row3(double finalResult) {
  return PrettyGauge(
    gaugeSize: 200,
    minValue: 0,
    needleColor: Colors.black,
    maxValue: 40,
    currentValue: finalResult,
    startMarkerStyle:
        const TextStyle(color: ColorsRes.redColor, fontWeight: FontWeight.bold),
    endMarkerStyle: const TextStyle(
        color: ColorsRes.greenColor, fontWeight: FontWeight.bold),
    segments: [
      GaugeSegment('UnderWeight', 11.5, ColorsRes.redColor),
      GaugeSegment('Normal', 11.5, ColorsRes.orangeColor),
      GaugeSegment('OverWeight', 8.5, ColorsRes.greyColor),
      GaugeSegment('Obese', 8.5, ColorsRes.greenColor),
    ],
    valueWidget: Text(
      finalResult != 0 ? finalResult.toStringAsFixed(2) : '',
      style: const TextStyle(fontSize: 20),
    ),
  );
}

Widget row4({String bmi = '', double result = 0}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        Text(
          bmi,
          style: const TextStyle(
              color: ColorsRes.greenColor,
              fontWeight: FontWeight.bold,
              fontSize: 21),
        ),
        const Spacer(),
        Text(
          result.toStringAsFixed(2),
          style: const TextStyle(
              color: ColorsRes.greenColor,
              fontWeight: FontWeight.bold,
              fontSize: 21),
        ),
        const SizedBox(height: 50),
      ],
    ),
  );
}

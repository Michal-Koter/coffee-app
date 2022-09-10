import 'package:first_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController txtInput = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isWater = true;
  bool isBeans = false;
  double? input;
  late List<bool> isSelected;
  String message = '';

  @override
  void initState() {
    isSelected = [isWater, isBeans];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    message =
        'Pleas insert how much ${(isWater) ? 'brew have you want' : 'beans you have'}';
    return Scaffold(
        appBar: AppBar(
          title: const Text('Water/Beans Calculator'),
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ToggleButtons(
                  isSelected: isSelected,
                  onPressed: (value) {
                    if (value == 0) {
                      isWater = true;
                      isBeans = false;
                    } else {
                      isWater = false;
                      isBeans = true;
                    }
                    setState(() {
                      isSelected = [isWater, isBeans];
                    });
                  },
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Water',
                          style: TextStyle(fontSize: fontSize),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Beans',
                          style: TextStyle(fontSize: fontSize),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtInput,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: message),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                  onPressed: findAmount,
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),
              Text(
                result,
                style: TextStyle(fontSize: fontSize),
              )
            ],
          ),
        ));
  }

  void findAmount() {
    double output = 0;
    double input = double.tryParse(txtInput.text) ?? 0;
    if (isWater) {
      output = input / 100 * 6;
    } else {
      output = input * 100 / 6;
    }
    setState(() {
      result =
          'You need ${output.toStringAsFixed(2)} ${(isWater) ? 'grams of beans' : 'millilitres of water'}';
    });
  }
}

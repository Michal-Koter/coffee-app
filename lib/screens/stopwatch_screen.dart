import 'package:first_app/shared/menu_bottom.dart';
import 'package:first_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../data/stopwatch.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  bool isRun = false;
  Stopwatch stopwatch = Stopwatch();
  String dif = '00:00:00.00';
  String buttonText = 'Start';
  TextStyle buttonStyle =  TextStyle(fontSize: 32, backgroundColor: Colors.green, color: Colors.black);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stopwatch',
        ),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              button(context),
              Text(dif, style: const TextStyle(fontSize: 32),),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(context) {
    return TextButton(
        onPressed: () {
          if (isRun) {
            isRun = false;
            stopwatch.setStop();
          } else {
            isRun = true;
            stopwatch.setStart();
            show();
          }
          setState(() {
            if (isRun) {
              buttonText = 'Stop';
              buttonStyle =  TextStyle(fontSize: 32, backgroundColor: Colors.red, color: Colors.black);
            } else {
              buttonText = 'Start';
              buttonStyle =  TextStyle(fontSize: 32, backgroundColor: Colors.green, color: Colors.black);
            }
            isRun;
          });
        },
        child: Text(buttonText, style: buttonStyle,));
  }

  Future show() async {
    while (isRun && stopwatch.getStop() == null) {
      await Future.delayed(const Duration(milliseconds: 50), () {});
      setState(() {
        dif = stopwatch.difference();
      });
    }
  }
}

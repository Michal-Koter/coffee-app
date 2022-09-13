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
  String dif = '0:00:00.00';
  String runBtnText = 'Start';
  TextStyle runBtnStyle = const TextStyle(
      fontSize: 32, backgroundColor: Colors.green, color: Colors.black);
  TextStyle resetBtnStyle = const TextStyle(
      fontSize: 32, backgroundColor: Colors.grey, color: Colors.black54);


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
              runButton(),
              isRun ? roundButton() : resetButton(),
              Text(
                dif,
                style: const TextStyle(fontSize: 32),
              ),
              rounds(),
            ],
          ),
        ),
      ),
    );
  }

  Widget runButton() {
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
              runBtnText = 'Stop';
              runBtnStyle = const TextStyle(
                  fontSize: 32,
                  backgroundColor: Colors.red,
                  color: Colors.black);
              resetBtnStyle = const TextStyle(
                  fontSize: 32,
                  backgroundColor: Colors.grey,
                  color: Colors.black54);
            } else {
              runBtnText = 'Start';
              runBtnStyle = const TextStyle(
                  fontSize: 32,
                  backgroundColor: Colors.green,
                  color: Colors.black);
              resetBtnStyle = const TextStyle(
                  fontSize: 32,
                  backgroundColor: Colors.white70,
                  color: Colors.black);
            }
            isRun;
          });
        },
        child: Text(
          runBtnText,
          style: runBtnStyle,
        ));
  }

  Widget resetButton() {
    return TextButton(
      onPressed: () {
        if (!isRun) {
          stopwatch.reset();
          setState(() {
            dif = '0:00:00.00';
          });
        }
      },
      child: Text(
        'Reset',
        style: resetBtnStyle,
      ),
    );
  }

  Widget roundButton() {
    return TextButton(
        onPressed: () {
          if (isRun) {
            stopwatch.setRound();
          }
        },
        child: Text('Round', style: resetBtnStyle,));
  }

  Future show() async {
    while (isRun && stopwatch.getStop() == null) {
      await Future.delayed(const Duration(milliseconds: 50), () {});
      setState(() {
        dif = stopwatch.difference();
      });
    }
    stopwatch.clock = stopwatch.clock + DateTime.now().difference(stopwatch.start!) ;
  }

  Widget rounds() {
    List<Text> data = [];
    for (int i=0;i<stopwatch.rounds.length;i++) {
      String massage = stopwatch.rounds[i].toString();
      massage = massage.substring(0, massage.length-4);
      data.add(Text('${i+1} round: $massage',));
    }
    return Column(
      children: [
        ...data
      ],
    );
  }
}

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
  Color runBtnColor = Colors.green;
  ButtonStyle resetBtnStyle = OutlinedButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Colors.grey,
    textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    padding: const EdgeInsets.all(16),
    shape: const StadiumBorder(),
  );

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
              if (isRun) currentRound(),
            ],
          ),
        ),
      ),
    );
  }

  Widget runButton() {
    return OutlinedButton(
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
            runBtnColor = Colors.red;
          } else {
            runBtnText = 'Start';
            runBtnColor = Colors.green;
          }
          isRun;
        });
      },
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        backgroundColor: runBtnColor,
        textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(16),
        shape: const StadiumBorder(),
      ),
      child: Text(
        runBtnText,
      ),
    );
  }

  Widget resetButton() {
    return OutlinedButton(
      onPressed: () {
        if (!isRun) {
          stopwatch.reset();
          setState(() {
            dif = '0:00:00.00';
          });
        }
      },
      style: resetBtnStyle,
      child: const Text(
        'Reset',
      ),
    );
  }

  Widget roundButton() {
    return OutlinedButton(
        onPressed: () {
          if (isRun) {
            stopwatch.setRound();
          }
        },
        style: resetBtnStyle,
        child: const Text(
          'Round',
        ));
  }

  Future show() async {
    while (isRun && stopwatch.getStop() == null) {
      await Future.delayed(const Duration(milliseconds: 50), () {});
      setState(() {
        dif = stopwatch.difference();
      });
    }
    stopwatch.clock =
        stopwatch.clock + DateTime.now().difference(stopwatch.start!);
  }

  Widget rounds() {
    List<Text> data = [];
    for (int i = 0; i < stopwatch.rounds.length; i++) {
      String massage = stopwatch.rounds[i].toString();
      massage = massage.substring(0, massage.length - 4);
      data.add(Text(
        '${i + 1} round: $massage',
      ));
    }
    return Column(
      children: [...data],
    );
  }

  Widget currentRound() {
    if (stopwatch.start != null) {
      Duration round = stopwatch.runningTime();
      String massage = round.toString();
      massage = massage.substring(0, massage.length - 4);
      return Text('${stopwatch.rounds.length + 1} round: $massage');
    }
    return const Text('');
  }
}

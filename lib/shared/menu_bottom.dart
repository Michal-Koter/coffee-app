import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Stopwatch',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_outlined), label: 'Water/Beans')
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/stopwatch');
            break;
          case 2:
            Navigator.pushNamed(context, '/calculator');
            break;
        }
      },
    );
  }
}

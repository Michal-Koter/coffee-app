import 'package:first_app/screens/brew_screen.dart';
import 'package:first_app/screens/sessions_screen.dart';
import 'package:first_app/screens/stopwatch_screen.dart';
import 'package:first_app/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import '../screens/calculator_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Stopwatch',
      'Water/Beans Calculator',
      'Brew Methods Guide',
      'Notes',
      'Weather'
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      decoration: BoxDecoration(color: Colors.brown),
      child: Text(
        'First App',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    ));
    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(
            element,
            style: const TextStyle(fontSize: 18),
          ),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = const IntroScreen();
                break;
              case 'Stopwatch':
                screen = const StopwatchScreen();
                break;
              case 'Water/Beans Calculator':
                screen = const Calculator();
                break;
              case 'Brew Methods Guide':
                screen = const BrewMethodScreen();
                break;
              case 'Notes':
                screen = const SessionsScreen();
                break;
              case 'Weather':
                screen = const WeatherScreen();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    }
    return menuItems;
  }
}

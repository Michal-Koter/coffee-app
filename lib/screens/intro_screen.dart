import 'package:first_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:first_app/shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coffe app')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/coffee-beans.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(100, 200)),
                    color: Colors.white70,
                  ),
                  child: const Text(
                    'The coffee will be with you.\nAlways!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0,
                        color: Colors.grey,
                      )
                    ]),
                  )))),
    );
  }
}

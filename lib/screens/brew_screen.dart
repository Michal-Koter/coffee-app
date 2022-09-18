import 'dart:convert';

import 'package:first_app/shared/menu_bottom.dart';
import 'package:first_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrewMethodScreen extends StatefulWidget {
  const BrewMethodScreen({Key? key}) : super(key: key);

  @override
  State<BrewMethodScreen> createState() => _BrewMethodScreenState();
}

class _BrewMethodScreenState extends State<BrewMethodScreen> {
  List<Widget> boxes = [];

  @override
  void initState() {
    tile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brew methods'),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          ...boxes,

         /* InkWell(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/chemex.jpg'),
                      fit: BoxFit.cover)),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: const Text(
                    'CHEMEX',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ),
          )*/
        ],
      ),
    );
  }

  Future tile() async{
    final String response = await rootBundle.loadString('assets/brew_method.json');
    final Map<String, dynamic> data = await jsonDecode(response);

    for (Map<String, dynamic> method in data['methods']) {
      setState((){
        boxes.add(
            InkWell(
              onTap: () {},
              child: Container(
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/${method['img']}'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      method["name"].toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
            )
        );
      });
    }
  }
}

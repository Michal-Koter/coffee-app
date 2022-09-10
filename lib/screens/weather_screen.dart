import 'package:first_app/data/weather.dart';
import 'package:flutter/material.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather("", "", 0, 0, 0, 0);
  final TextEditingController txtPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Weather')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                        hintText: 'Enter a city',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: getData,
                        )),
                  )),
              weatherRow('Place: ', result.name),
              weatherRow('Description: ', result.description),
              weatherRow('Temperture: ', result.temperture.toStringAsFixed(2)),
              weatherRow('Percived: ', result.percived.toStringAsFixed(2)),
              weatherRow('Pressure: ', result.pressure.toStringAsFixed(0)),
              weatherRow('Humidity: ', result.humidity.toStringAsFixed(0)),

            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label,
              style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor
            ),),),
          Expanded(
            flex: 4,
            child: Text(value,
              style: TextStyle(fontSize: 20,
                  color: Theme.of(context).primaryColor
              ),),)
        ],
      ),);
    return row;
  }
}

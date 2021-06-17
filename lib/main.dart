import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var locationMessage = "0,0";
  var currentTempCelsius = "0";
  var currentTempFar = "0";
  Location location = new Location();
  WeatherFactory wf = new WeatherFactory("0a2fb214733a302c10a81d35b165ee99",
      language: Language.DANISH);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    timer = Timer.periodic(
        Duration(seconds: 2), (Timer t) => getCurrentLocation());
  }

  void getCurrentLocation() async {
    LocationData _locationData;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      try {
        _permissionGranted = await location.requestPermission();
      } catch (e) {
        print(e);
      }
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.enableBackgroundMode(enable: true);

    _locationData = await location.getLocation();

    setState(() {
      locationMessage = "${_locationData.latitude}, ${_locationData.longitude}";
    });

    Weather currentWeather = await wf.currentWeatherByLocation(
        _locationData.latitude!.toDouble(),
        _locationData.longitude!.toDouble());

    http.get(Uri.parse(
        'http://producer-quick-crocodile-ah.eu-gb.mybluemix.net/produce?lat=${_locationData.latitude}&long=${_locationData.longitude}&temp=${currentWeather.temperature!.fahrenheit!}'));

    setState(() {
      currentTempCelsius = currentWeather.temperature!.celsius!.toDouble().toStringAsFixed(2);
      currentTempFar = currentWeather.temperature!.fahrenheit!.toDouble().toStringAsFixed(2);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collar"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Get Animal's Location",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Current Position $locationMessage"),
          Text("Current Temperature $currentTempCelsius ° Celsius , $currentTempFar ° Fahrenheit")
        ],
      )),
    );
  }
}

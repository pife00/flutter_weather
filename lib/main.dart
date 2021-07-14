import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(title: "weather", home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var temp;
  var description;
  var currenly;
  var humidity;
  var windSpeed;
  final API = "";
  String city = "Quibdo";
  

  Future getWeather() async{
    String URL = "http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$API";
    var response = await http.get(Uri.parse(URL));

    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      setState(() {
        this.temp = result['main']['temp'];
        this.description = result['weather'][0]['description'];
        this.currenly = result['weather'][0]['main'];
        this.humidity = result['main']['humidity'];
        this.windSpeed = result['wind']['speed'];
      });
    }
    
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currenly in Boston",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  temp != null ? "$temp\u00B0":"loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                   currenly != null ? "$currenly":"loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text(
                    "temperature",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  trailing: Text(temp != null ? "$temp\u00B0":"loading"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text(
                    "Description",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  trailing: Text(description != null ? "$description\u00B0":"loading"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun),
                  title: Text(
                    "Humidity",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  trailing: Text(humidity != null ? "$humidity\u00B0":"loading"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text(
                    "Wind Speed",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  trailing: Text(windSpeed != null ? "$windSpeed\u00B0":"Loading"),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

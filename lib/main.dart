import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title:"weather",
    home:MyApp()
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text("Weather",textAlign: TextAlign.center),
         backgroundColor: Colors.redAccent,
       ),
       body: Column(
         children:<Widget> [
         Container(
           height: MediaQuery.of(context).size.height/3,
           width: MediaQuery.of(context).size.width,
           color: Colors.red,
           child: Column(
             children:<Widget> [
               Padding(
                 padding: EdgeInsets.only(bottom:10.0),
                 child: Text("Currenly in Boston"),
                 )
           ],),
         )
       ],

       ),
    );
  }
}
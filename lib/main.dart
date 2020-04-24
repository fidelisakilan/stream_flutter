import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller=StreamController<double>.broadcast();
  StreamSubscription<double> streamSubscription;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center( 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text('Subscribe'),
                color: Colors.yellow,
                onPressed: ()async{ 
                 Stream stream = controller.stream; 
              streamSubscription=stream.listen((value) {
              print('Value from controller: $value');
            });
              }),
              MaterialButton(
                child: Text('Emit values'),
                color: Colors.orange,
                onPressed: (){
                 controller.add(12); 
              }),
               MaterialButton(
                child: Text('Unsubscribe'),
                color: Colors.red,
                onPressed: (){
                 streamSubscription?.cancel();
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Stream<double> getDelayedRandomVlue()async*{
  //   var random =Random();
  //   while(true){
  //   await Future.delayed(Duration(seconds: 1));
  //   yield random.nextDouble();
  //   }
  // }
}


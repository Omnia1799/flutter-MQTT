import 'package:flutter/material.dart';
import 'package:flutter_mqtt_app/widgets/mqttView.dart';
import 'package:flutter_mqtt_app/mqtt/state/MQTTAppState.dart';
import 'package:provider/provider.dart';
import 'widgets/requst.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    final MQTTManager manager = MQTTManager(host:'test.mosquitto.org',topic:'flutter/amp/cool',identifier:'ios');
    manager.initializeMQTTClient();

     */

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigoAccent),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        accentColor: Colors.indigoAccent,
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      home: const Home(title: 'Home'),
      // ChangeNotifierProvider<MQTTAppState>(
      //create: (_) => MQTTAppState(),
      //child: MQTTView(),
      //)
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push<dynamic>(context, MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) {
                    return ChangeNotifierProvider<MQTTAppState>(
                      create: (_) => MQTTAppState(),
                      child: MQTTView(),
                    );
                  }));
                },
                child: const Text(
                  'Motion',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigoAccent,
                  onPrimary: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push<dynamic>(context, MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) {
                    return ChangeNotifierProvider<MQTTAppState>(
                      create: (_) => MQTTAppState(),
                      child: MQTTView2(),
                    );
                  }));
                },
                child: const Text(
                  'Sensor',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigoAccent,
                  onPrimary: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child:Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text("Connect"),
                  onPressed: manager.connect ,
                ),
              )
            ],
          ) ,
        ),
      )
 */
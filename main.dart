import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    fetchData();
    super.didChangeDependencies();
  }

  Future<void> fetchData() async{
    const URL = 'https://aiw-test.herokuapp.com/api/v1/sessions';
    try {
      final response = await http.get(URL);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
    } catch (error) {
      throw error;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),

    );
  }
}

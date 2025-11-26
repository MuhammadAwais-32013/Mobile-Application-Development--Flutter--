import 'package:flutter/material.dart';
import 'FormV.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.amber, fontSize: 40),
        ),
      ),
      body: Center(child: Column(
        children: [ 
      Text("Stateless Widget"),
      SizedBox(height: 40),
      ElevatedButton(onPressed: (){
        Navigator.push(
        context,
          MaterialPageRoute(builder:(context)=> FormV()),
        );
      }, child: Text("Go to Form Validation "))
      
      ],
      ),
      ),
    );
  }
}

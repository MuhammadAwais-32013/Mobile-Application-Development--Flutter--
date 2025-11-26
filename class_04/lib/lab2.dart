// import 'package:flutter/material.dart';
// void main() {
// runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
// const MyApp({super.key});
// @override
// Widget build(BuildContext context) {
// return MaterialApp(
// title: 'Stateful Widget Example',
// theme: ThemeData(
// primarySwatch: Colors.blue,
// ),
// home: const CounterApp(),
// );
// }
// }
// class CounterApp extends StatefulWidget {
// const CounterApp({super.key});
// @override
// State<CounterApp> createState() => _CounterAppState();
// }
// class _CounterAppState extends State<CounterApp> {
// int _counter = 0;
// void _incrementCounter() {
// setState(() {
// _counter++;
// });

// }
// void _decrementCounter() {
// setState(() {
// _counter--;
// });
// }
// void _resetCounter() {
// setState(() {
// _counter = 0;
// });
// }
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(
// title: const Text('Stateful Widget Example'),
// backgroundColor: Colors.blue,
// ),
// body: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// const Text(
// 'You have pushed the button this many times:',
// ),
// Text(
// '$_counter',
// style: Theme.of(context).textTheme.headlineMedium,
// ),
// const SizedBox(height: 20),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// ElevatedButton(
// onPressed: _decrementCounter,

// child: const Text('-'),
// ),
// const SizedBox(width: 20),
// ElevatedButton(
// onPressed: _resetCounter,
// child: const Text('Reset'),
// ),
// const SizedBox(width: 20),
// ElevatedButton(
// onPressed: _incrementCounter,
// child: const Text('+'),
// ),
// ],
// ),
// ],
// ),
// ),
// floatingActionButton: FloatingActionButton(
// onPressed: _incrementCounter,
// tooltip: 'Increment',
// child: const Icon(Icons.add),
// ),
// );
// }
// }

import 'package:flutter/material.dart';
void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Hello World App Statefull',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: const HelloWorldWidget(),
);
}
}
class HelloWorldWidget extends StatelessWidget {
const HelloWorldWidget({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Hello World App'),
),
body: const Center(
child: Text(
'Hello World!',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,

),
),
),
);
}
}
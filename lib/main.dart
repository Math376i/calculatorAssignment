import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const CalcultorScreen(),
    );
  }
}

class CalcultorScreen extends StatelessWidget {
  const CalcultorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacing = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(children: [
        _inputField(Colors.yellow),
        _inputField(Colors.pink),
        _StackField()
      ]),
    );
  }

  Row _inputField(Color colors) {
    return Row(
      children: [
        Flexible(
            child: Container(
          height: 100,
          color: colors,
        ))
      ],
    );
  }

  Column _StackField() {
    return Column(
      children: [
        Container( child:
        TextField(
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: "Input"),
        ), color: Colors.green,)
      ],
    );
  }


}

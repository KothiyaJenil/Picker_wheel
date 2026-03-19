import 'package:flutter/material.dart';

void main(){
  runApp(Picker_wheel());
}


class Picker_wheel extends StatefulWidget {
  const Picker_wheel({super.key});

  @override
  State<Picker_wheel> createState() => _Picker_wheelState();
}

class _Picker_wheelState extends State<Picker_wheel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Picker_wheel"),
        ),
      ),
    );
  }
}

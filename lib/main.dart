import "package:flutter/material.dart";
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:async';

void main(){
  runApp(Picker_wheel());
}

class Picker_wheel extends StatefulWidget {
  const Picker_wheel({super.key});

  @override
  State<Picker_wheel> createState() => _Picker_wheelState();
}

class _Picker_wheelState extends State<Picker_wheel> {
  StreamController<int> controller = StreamController<int>();
  String selectedItemValue = "";
  int? lastSelectedItem;

  List<String> items = [
    "Pizza",
    "Burger",
    "Pasta",
  ];

  void removeItem(){
    if(lastSelectedItem != null){
      setState(() {
        items.removeAt(lastSelectedItem!);
        print(items.length);
      });
    }}

  void spinWheel() {
    final selected = Fortune.randomInt(0, items.length);
    controller.add(selected);
    print(items[selected]);
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        selectedItemValue = items[selected];
        lastSelectedItem = selected;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(selectedItemValue.isEmpty ? "selected value" : selectedItemValue, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 25),
              Center(
                child: SizedBox(
                  height: 500,
                  width: 400,
                  child: items.length == 1 ? Text("add items") : FortuneWheel(
                    onAnimationStart: removeItem,
                    selected: controller.stream,
                    indicators: [
                      FortuneIndicator(
                        alignment: Alignment.topCenter,
                        child: TriangleIndicator(
                          color: Colors.green,
                          width: 30,
                          height: 30,
                          elevation: 0,
                        ),
                      ),
                    ],

                    items: [
                      for (var item in items)
                        FortuneItem(
                            child: Text(item)
                        ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: spinWheel, child: Text("Spin"))
            ],
          )
      ),
    );
  }
}

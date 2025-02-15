import 'package:flutter/material.dart';

class Random extends StatelessWidget{
  const Random({super.key})

  @override
  Widget build(BuildContext context) {
   return Center(
    child: Column(children: [
      ElevatedButton(onPressed: null, child: Text("Randomize"))
    ]),
   );
  }
}
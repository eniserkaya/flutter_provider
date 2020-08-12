import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  ValueNotifier valueNotifier;

  TestPage(this.valueNotifier);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Title')),
        body: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Column(
            children: [
              Text('sayısı:'),
              ValueListenableBuilder(
                valueListenable: widget.valueNotifier,
                builder: (BuildContext context, value, Widget child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$value'),
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}

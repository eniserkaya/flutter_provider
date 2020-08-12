import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/test_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Title')),
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('Butona basma sayısı:'),
              ValueListenableBuilder(
                  builder: (BuildContext context, int value, Widget child){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$value'),
                      ],
                    );
                  },
                valueListenable: _counter),

          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          _counter.value % 5 == 4 ? goTestScreen(context,_counter) :  _counter.value += 1;
        },
      ),
    );
  }
}

goTestScreen(BuildContext context,ValueNotifier valueNotifier) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TestPage(valueNotifier)),
  );}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter - 1 < 0) {
      Fluttertoast.showToast(
          msg: "Não se pode ter valores negativos para quantidade de pessoas.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.rotate_left),
            onPressed: () {
              setState(() {
                _counter = 0;
              });
              Fluttertoast.showToast(
                  msg: "Valor resetado.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 18.0);
            },
          )
        ],
        backgroundColor: Color(0xFF7159C1),
        centerTitle: true,
        title: Text('Resturant Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/restaurant.png'),
            Text('Pessoas dentro do resturante',
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18)),
            Text(
              '$_counter',
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 50),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: _decrementCounter,
                  elevation: 2.0,
                  fillColor: Color(0xFF7159C1),
                  child: Icon(
                    Icons.exposure_neg_1,
                    size: 35.0,
                    color: Color(0xFFFFFFFF),
                  ),
                  padding: EdgeInsets.all(20.0),
                  shape: CircleBorder(),
                ),
                SizedBox(width: 50),
                RawMaterialButton(
                  onPressed: _incrementCounter,
                  elevation: 2.0,
                  fillColor: Color(0xFF7159C1),
                  child: Icon(
                    Icons.plus_one,
                    size: 35.0,
                    color: Color(0xFFFFFFFF),
                  ),
                  padding: EdgeInsets.all(20.0),
                  shape: CircleBorder(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

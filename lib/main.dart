import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: [
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-wC5Yyu6jRf_HYALdG629Uo-fwt4WZQrmdw&usqp=CAU'),
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQETA2qGoN3FgSM3ed-34WxJiPH-SDAHILegg&usqp=CAU'),
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmnCd4qXRweR_i2Vk2ZC6l7NMzbBMRc76GmQ&usqp=CAU'),
              ],
              options: CarouselOptions(
                height: 200.0,
              ),
            ),
            Spacer(),
            LinearProgressIndicator(
  value: 0.5,
)
          ],
        ),
      ),
    );
  }
}
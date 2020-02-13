import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TTS Idea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter TTS Idea'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FlutterTts flutterTts = FlutterTts();

  
  
  @override
  Widget build(BuildContext context) {
 
    Future _speak() async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1);
      await flutterTts.speak('Hello');
    }

    return Scaffold(
      appBar: AppBar(
 
        title: Text(widget.title),
      ),
      body: Center(
    
        child: Container(
          child: RaisedButton(
            child: Text('Tap this button'),
            onPressed: () => _speak(),
            )
        ),
      ),
    );
  }
}

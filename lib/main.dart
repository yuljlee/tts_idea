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
  
    TextEditingController textEditingController = TextEditingController();
  
    Future _speak(String text) async {
      //print(await flutterTts.getLanguages);
      await flutterTts.setLanguage('ko-KR');
      //await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1);
      print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: textEditingController,),
                  RaisedButton(
                    child: Text('Tap this button'),
                    onPressed: () => _speak(textEditingController.text),
                  )
              ],)
            ),
      );
  }
}

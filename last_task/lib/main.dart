import 'package:flutter/material.dart';
import 'package:last_task/screens/ScreenA.dart';

void main() {
  runApp(
    MaterialApp(
      title: "weather",
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("天気予報を見れるよ"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset("image/tennki.png"),
              width: 200,
              height: 200,
              color: Colors.orange,
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScreenA();
                }));
              },
              child: Text("天気を見る"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
        ],
      ),
    );
  }
}

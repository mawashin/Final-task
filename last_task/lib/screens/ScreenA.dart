import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ScreenA extends StatefulWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  String _tokyoweather = "";
  String _osakaweather = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("戻る")),
                ElevatedButton(
                  onPressed: () async {
                    Uri url = Uri.parse(
                        "http://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=14599c0b3751226f7412c6f68e7693a3");
                    Response res = await get(url);
                    // print(res.body);
                    var resJson = json.decode(res.body);
                    setState(() {
                      _tokyoweather = resJson["weather"][0]["main"];
                    });
                  },
                  child: Text("東京の天気"),
                ),
                Container(child: Text("以下に表示されます")),
                Row(
                  children: [
                    Container(
                      child: Center(
                          child: Text(_tokyoweather),
                      ),
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      child: _weathericon(_tokyoweather),
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _osakaweather = "すいません。まだ見れません！近日中に実装します";
                    });
                  },
                  child: Text("大阪の天気"),
                ),
                Container(child: Text("以下に表示されます")),
                Container(child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(_osakaweather),
                )),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

_weathericon(String weather) {
  if (weather == "Clear") {
    return Image.asset("image/Clear.png");
  } else if (weather == "Clouds") {
    return Image.asset("image/Clouds.png");
  } else if (weather == "Rain") {
    return Image.asset("image/Rain.png");
  } else if (weather == "Snow") {
    return Image.asset("image/Snow.png");
  }
}

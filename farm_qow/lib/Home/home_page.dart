import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<bool?> _onBack(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("U Sure Wanna Exit?"),
        content: Text("Need to login again Later"),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Yes"),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("No"),
          )
        ],
      ),
    );
  }

  List _data = [];

  Future<void> _refresh() async {
    final Map res =
        json.decode(await rootBundle.loadString('json_model/sapi.json'));
    setState(() {
      _data = res["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    this._refresh();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final response = await _onBack(context);

        return response ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Farm.QOW"),
        ),
        body: ListView.builder(
          itemCount: _data == null ? 0 : _data.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              margin: EdgeInsets.all(15),
              child: ListTile(
                title: Text(_data[index]["nama"]),
              ),
            );
          },
        ),
      ),
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("widget.title"),
//         ),
//         HomePage: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (BuildContext context, index) {
//             return Column(
//               children: [],
//             );
//           },
//         ));
//   }
// }

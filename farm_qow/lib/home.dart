import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final response = await _onBack(context);

        return response ?? false;
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
        ),
      ),
    );
  }
}

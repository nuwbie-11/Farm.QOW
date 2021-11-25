import 'package:farm_qow/Pages/MainPage/Data%20Sapi/dataSapi.dart';
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

class SearchHalamanSapi extends StatelessWidget {
  // const SearchHalamanSapi({Key? key}) : super(key: key);
  // TextEditingController searchInput = new TextEditingController();
  var searchInput = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
<<<<<<< HEAD
                image: AssetImage(
                  "assets/bg/bg5.jpg",
                ),
                fit: BoxFit.cover)),
=======
                image: AssetImage("assets/bg/bg5.jpg",),
                fit: BoxFit.cover
            )
        ),
>>>>>>> main
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
          body: Column(
<<<<<<< HEAD
            children: [
              SizedBox(
                height: 50,
              ),
=======

            children: [
              SizedBox(height: 50,),
>>>>>>> main
              Container(
                color: Colors.white,
                child: TextField(
                  // textAlign: TextAlign.center,
                  autofocus: true,
<<<<<<< HEAD
                  onChanged: (ValueKey) {
                    searchInput = ValueKey.toString();
                  },
                  onSubmitted: (ValueKey) {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
=======
                  onChanged: (ValueKey){
                    searchInput = ValueKey.toString();
                  },
                  onSubmitted: (ValueKey) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
>>>>>>> main
                      return HalamanDataSapi(ValueKey.toString());
                    }));
                  },

                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                      size: 30,
                    ),
                    suffixIcon: IconButton(
<<<<<<< HEAD
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
=======
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
>>>>>>> main
                          return MyApp(0);
                        }));
                      },
                      icon: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
<<<<<<< HEAD
                        borderRadius: BorderRadius.circular(30)),
=======
                      borderRadius: BorderRadius.circular(30)
                    ),
>>>>>>> main
                    hintText: "Search",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:farm_qow/Pages/Data%20Sapi/dataSapi.dart';
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
                image: AssetImage("assets/bg/bg5.jpg",),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
          body: Column(

            children: [
              SizedBox(height: 50,),
              Container(
                color: Colors.white,
                child: TextField(
                  // textAlign: TextAlign.center,
                  autofocus: true,
                  onChanged: (ValueKey){
                    searchInput = ValueKey.toString();
                  },
                  onSubmitted: (ValueKey) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return HalamanDataSapi(ValueKey.toString());
                    }));
                  },

                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return HalamanDataSapi(searchInput.toString());
                        }));
                      },
                      icon: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
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

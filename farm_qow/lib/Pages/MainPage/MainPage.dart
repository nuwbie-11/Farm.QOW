import 'package:farm_qow/Pages/Input%20Susu/InputSusuById.dart';
import 'package:farm_qow/Pages/Tambah%20Sapi/TambahSapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';
import 'Data Sapi/dataSapi.dart';
import 'Halaman Susu/HalamanSusu.dart';

class MyApp extends StatefulWidget {
  var currentIndex;
  String? search4Sapi;
  MyApp(this.currentIndex, this.search4Sapi);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var thisPage;
    double displayWidth = MediaQuery.of(context).size.width;
    if (widget.currentIndex == 0) {
      thisPage = Center(
        child: HalamanDataSapi(""),
      );
    } else if (widget.currentIndex == 1) {
      thisPage = Center(
        child: HalamanSusu(),
      );
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/bg/bg5.jpg",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer: Drawer(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromRGBO(143, 197, 255, 0.95),
                image: DecorationImage(
                    image: AssetImage("assets/bg/bg5.jpg"), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Yuk Sri",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.blue))
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 40,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 27),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Builder(builder: (context) {
              return InkWell(
                onTap: () {
                  // Navigator.push(context, TransitionTopToBottom(SearchHalamanSapi()));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Farm.QOW'),
                      // AnimatedTextKit(
                      //   animatedTexts: [
                      //     WavyAnimatedText('Farm.QOW')
                      //   ],
                      //   repeatForever: true,
                      //   isRepeatingAnimation: true,
                      // ),
                      Row(
                        children: [
                          Icon(Icons.search),
                        ],
                      )
                    ],
                  ),
                ),
              );
            })),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                if (widget.currentIndex == 0) {
                  Navigator.push(context, TransitionBottomToTop(TambahSapi()));
                } else if (widget.currentIndex == 1) {
                  Navigator.push(
                      context, TransitionBottomToTop(InputSusuById()));
                }
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            );
          }),
        ),
        body: thisPage,
        bottomNavigationBar: Container(
          height: displayWidth * .155,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .06),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  widget.currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == widget.currentIndex
                        ? displayWidth * .32
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height:
                          index == widget.currentIndex ? displayWidth * .12 : 0,
                      width:
                          index == widget.currentIndex ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                        color: index == widget.currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == widget.currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == widget.currentIndex
                                  ? displayWidth * .13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == widget.currentIndex ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == widget.currentIndex
                                    ? '${listOfStrings[index]}'
                                    : '',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == widget.currentIndex
                                  ? displayWidth * .03
                                  : 20,
                            ),
                            ImageIcon(
                              listOfIcons[index],
                              size: displayWidth * .076,
                              color: index == widget.currentIndex
                                  ? Colors.blueAccent
                                  : Colors.black26,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<AssetImage> listOfIcons = [
    (AssetImage("assets/icons/sapi.png")),
    (AssetImage("assets/icons/susu.png")),
    (AssetImage("assets/icons/sapi.png")),
    (AssetImage("assets/icons/susu.png")),
  ];

  List<String> listOfStrings = [
    'Sapi',
    'Susu',
    'Settings',
    'Account',
  ];
}

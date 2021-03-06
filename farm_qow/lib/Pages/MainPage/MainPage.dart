// ignore_for_file: file_names

import 'package:farm_qow/Controller/checkup_controller.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Pages/Input%20Susu/InputSusuById.dart';
import 'package:farm_qow/Pages/MainPage/Akun/PreviewAkun.dart';
import 'package:farm_qow/Pages/MainPage/Laporan/laporan.dart';
import 'package:farm_qow/Pages/Tambah%20Sapi/TambahSapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';
import 'Data Sapi/dataSapi.dart';
import 'Halaman Susu/HalamanSusu.dart';

class MyApp extends StatefulWidget {
  var currentIndex;
  MyApp(this.currentIndex);

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
    } else if (widget.currentIndex == 2) {
      thisPage = Center(
        child: Laporan(),
      );
    } else if (widget.currentIndex == 3) {
      thisPage = Center(
        child: PreviewAkun(),
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
        floatingActionButton: (widget.currentIndex < 2 &&
                    user_login[8] == true) ||
                (widget.currentIndex == 1 && user_login[8] == false)
            ? FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                child: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      // CheckUpController().populateUser();
                      // print(user_login);
                      if (widget.currentIndex == 0) {
                        if (user_login[8] == false) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Warning"),
                                  content: Text("Anda Bukan Manager !"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop(true);
                                        });
                                      },
                                      child: Text("Yes",
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  ],
                                );
                              }).then((value) => null);
                        } else {
                          Navigator.push(
                              context, TransitionBottomToTop(TambahSapi()));
                        }
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
              )
            : null,
        // appBar: widget.currentIndex != 2

        //         backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
        //         elevation: 0,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.vertical(
        //             bottom: Radius.circular(20),
        //           ),
        //         ),
        //         title: Text(listOfStrings[widget.currentIndex]),
        //       )
        //     : null,
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
    (const AssetImage("assets/icons/sapi.png")),
    (const AssetImage("assets/icons/susu.png")),
    (const AssetImage("assets/icons/Laporan.png")),
    (const AssetImage("assets/icons/akun.png")),
  ];

  List<String> listOfStrings = [
    'Sapi',
    'Susu',
    'Laporan',
    'Akun',
  ];
}

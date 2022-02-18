import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tablet/pages/Navigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _initialValue = true;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade800,
          title: Text("Hey mate, i'm pepper. How can i help you ?"),
        ),
        body: Align(
          alignment: Alignment.centerLeft,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/logo/pp.jpg",
                          height: 600,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    margin: EdgeInsets.only(right: 80, top: 45),
                                    child: Image.asset(
                                      "assets/images/schedules.jpg",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'View schedule',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 35.0,
                                        fontFamily: 'Roboto',
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => navigation()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                margin: EdgeInsets.only(right: 80, top: 45),
                                child: Image.asset(
                                  "assets/images/nav.jpg",
                                ),
                              ),
                              Text(
                                'Campus Navigation',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                margin: EdgeInsets.only(right: 80, top: 45),
                                child: Image.asset(
                                  "assets/images/picture.jpg",
                                ),
                              ),
                              Text(
                                'Take a picture',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),

                        // GestureDetector(
                        //     onTap: () {},
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       width: MediaQuery.of(context).size.width / 4,
                        //       height: MediaQuery.of(context).size.height / 4,
                        //       decoration: BoxDecoration(
                        //           color: Colors.grey.shade300,
                        //           shape: BoxShape.rectangle,
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(25))),
                        //       margin: EdgeInsets.only(right: 8, top: 8),
                        //       child: Image.asset(
                        //         "assets/images/nav.jpg",
                        //       ),
                        //     )),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedFontSize: 22,
          unselectedFontSize: 15,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text("Camera"),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("search"),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("profile"),
                backgroundColor: Colors.red),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        )
        // bottomNavigationBar: Container(
        //     height: 60,
        //     decoration: BoxDecoration(
        //       color: Theme.of(context).primaryColor,
        //       borderRadius: const BorderRadius.only(
        //         topLeft: Radius.circular(20),
        //         topRight: Radius.circular(20),
        //       ),
        //     ))

        );
  }
}

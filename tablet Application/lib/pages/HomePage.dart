import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _initialValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
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
                        height: 670,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Container(
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
                              "assets/images/schedules.jpg",
                            ),
                          )),
                      SizedBox(
                        height: 120,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 4,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            margin: EdgeInsets.only(right: 80, top: 8),
                            child: Image.asset(
                              "assets/images/nav.jpg",
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 4,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            margin: EdgeInsets.only(right: 8, top: 45),
                            child: Image.asset(
                              "assets/images/picture.jpg",
                            ),
                          )),
                      SizedBox(
                        height: 120,
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
    );
  }
}

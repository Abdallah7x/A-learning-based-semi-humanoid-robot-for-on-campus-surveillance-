import 'package:tablet_app/screens/admin_dashboard.dart';

import 'screens/constants.dart';
//import 'package:auth_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/home.dart';
import 'package:tablet_app/screens/admin_dashboard.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor.withOpacity(0.1),
        textTheme: TextTheme(
          headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily:'Karla'),
          button: TextStyle(color: kPrimaryColor),
          headline3:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily:'Karla'),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            
            child: Container(
              
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://i.gifer.com/J4o.gif"),
                  //assets/images/Technologyconnectiondigitaldataabstractbackgroundsimplefuturisticmoderngeometricconnectionlinebackgroundvector1.png
                  fit: BoxFit.cover,
                ),
              ),
            
          child: Row(
             
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/images/miu.png", width: 100.0, height: 100.0,
            ),
          
            
            Container(
              margin: EdgeInsets.only(left: 250,bottom: 0),
            child: Align(
              //alignment: Alignment.topLeft,
              
              alignment: Alignment.center,
            child: Image(image:         
              NetworkImage("https://media.giphy.com/media/RJPBinhXAfOYpBtWWN/giphy.gif" ),
              //https://media.giphy.com/media/S6N46NjySc3YGmGpIl/giphy.gif
              //https://media.giphy.com/media/RJPBinhXAfOYpBtWWN/giphy.gif
              //https://i.gifer.com/LL5N.gif
              height: 300,
            ),
            ),
            ),
         ],
          ),
           ),
          ),
          Flexible(
            child: Column(         
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             
              children: <Widget>[
                
                
                //  Align(
                //   //alignment: Alignment.topLeft,
                //   alignment: Alignment.topCenter,
                //   child: Image.asset(         
                //   "assets/images/pp.png",
                //   height: 200,
                //   ),
                // ),
                  RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      
                      // TextSpan(
                        
                      //   text: "",
                      //   style: Theme.of(context).textTheme.headline4,
                      // ),
                      TextSpan(
                        text: "Welcome back, Im Pepper Robot!!",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ),
                ),
              Container(
                
           //padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
               decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                         color:Color(0x00008B).withOpacity(1),
                      ),
                 height: 138.0,
                 width: 900,
                
                // width: 100.0,
                 margin: EdgeInsets.only(bottom: 69,right: 0),
                //color: Colors.blueAccent,
                child: Row(
                children: <Widget>[
                  
                
                FittedBox(
                  child: GestureDetector(
                  
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                            return Admindashboard();
                        },
                      )
                      );
                      
                    },
                    child: Container(
                      //margin: EdgeInsets.all(30),
                      margin: EdgeInsets.only(top: 0,left: 200,right:40),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                         
                      decoration: BoxDecoration(
                                         color:Color(0xFFFFFF).withOpacity(1),
                            //FF0E3311
                        borderRadius: BorderRadius.circular(25),
                        //color: Colors.red,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Staff",
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                          //SizedBox(width: 200),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),

                    ),
                  ),
                ),
             
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                            return Home();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 0,right: 40),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kPrimaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Student",
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                         // SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                      
                    ),
                  ),
                 ),
                  FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                            return WelcomeScreen();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                      decoration: BoxDecoration(
                        color:Color(0xFFFFFF).withOpacity(1),
                        borderRadius: BorderRadius.circular(25),
                        //color: kPrimaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Navigate me!",
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                         // SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                      
                    ),
                  ),
                  ),   
           ],
                
           ),
              ),
              ],
              
                
            ),
          ),
          
        ],
      ),
    );
  }
}

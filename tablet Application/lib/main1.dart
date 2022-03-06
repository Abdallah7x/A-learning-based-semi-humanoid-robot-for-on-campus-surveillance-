// import 'package:flutter/material.dart';
// //import 'package:tablet_app/Navbar/Navbar.dart';


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     //  body: //Column( children:<Widget>[
//     //   Container(
//     //     constraints: BoxConstraints.expand(),
//     //    decoration: BoxDecoration(
//     //       image: DecorationImage(
//     //         image: AssetImage("assets/images/pngtree-simple-background-of-multiple-color-gradient-app-interface-materials-png-image_392301.jpg"),
//     //         fit: BoxFit.cover,
//     //       ),
//     //     ),
//     //     // child: null /* add child content here */,
      
    
      
//     //     child: Row(
//     //       crossAxisAlignment: CrossAxisAlignment.start,
//     //       mainAxisSize: MainAxisSize.max,
//     //       mainAxisAlignment: MainAxisAlignment.start,
//     //       children: <Widget>[
//     //         Image.asset(
//     //           "assets/images/miu.png", width: 100.0, height: 100.0,
//     //         ),
            
//     //         Align(
//     //           //alignment: Alignment.topLeft,
//     //           alignment: Alignment.centerLeft,
//     //         child: Image.asset(         
//     //           "assets/images/png-transparent-pepper-humanoid-robot-softbank-robotics-corp-pepper-humanoid-robot-vegetables-technology.jpg",
//     //           height: 500,
//     //         ),
//     //         ),
            
//     //           Row(children: [Text("hi")],)
//     //       ],
//     //     ),
        
//     //   ),
     
//       body: SafeArea(
//         child: Container(
//           constraints: BoxConstraints.expand(),
//         decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage("assets/images/Technologyconnectiondigitaldataabstractbackgroundsimplefuturisticmoderngeometricconnectionlinebackgroundvector1.jpg"),
//              fit: BoxFit.cover,
//           ),
//          ),
         
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Hello There!",
//                     style: TextStyle(fontFamily: 'DancingScript-Bold'),
//                   ),
//                   SizedBox(height: 30,),
//                   Text("Automatic identity verification which enable you to verify your identity",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontSize: 15
//                       ),
//                   ),
//                    Align(
//               //alignment: Alignment.topLeft,
//               alignment: Alignment.centerLeft,
//             child: Image.asset(         
//               "assets/images/png-transparent-pepper-humanoid-robot-softbank-robotics-corp-pepper-humanoid-robot-vegetables-technology.jpg",
//               height: 200,
//             ),
//             ),
//                 ],
//               ),
//             ]
//           ),
//         )
//       )
//     );
//   }
// }

import 'screens/constants.dart';
//import 'package:auth_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          headline4: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          button: TextStyle(color: kPrimaryColor),
          headline3:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
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
              margin: EdgeInsets.only(left: 280,bottom: 0),
            child: Align(
              //alignment: Alignment.topLeft,
              
              alignment: Alignment.center,
            child: Image(image:         
              NetworkImage("https://i.gifer.com/LL5N.gif"),
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
                      TextSpan(
                        
                        text: "HI!",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      TextSpan(
                        text: "Im Pepper Robot!!",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ),
                ),
              Container(
                
           //padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
               decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                         color:Color(0x00008B).withOpacity(0.7),
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
                  
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                            return Home();
                        },
                      ));
                    },
                    child: Container(
                      //margin: EdgeInsets.all(30),
                      margin: EdgeInsets.only(top: 0,left: 220,right:40),
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
                            return WelcomeScreen();
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

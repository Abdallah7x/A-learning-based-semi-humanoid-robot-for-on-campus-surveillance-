

import 'package:tablet_app/main.dart';

import 'constants.dart';
//import 'package:auth_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/home.dart';







class Admindashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            
            child: Container(
              //margin: EdgeInsets.only(top: 150),
              constraints: BoxConstraints.expand(),
             decoration: BoxDecoration(
                image: DecorationImage(
                 image: NetworkImage("assets/images/5afc1489d89f4.jpg"),
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
               decoration: BoxDecoration(                     
                        borderRadius: BorderRadius.circular(25), 
                        color: Colors.white.withOpacity(0.8),              
                      ),
                height: 300,
                width: 696,
                
                 margin: EdgeInsets.only(left: 70,top: 50),
                //margin: EdgeInsets.all(20),
                child: Row(
             
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Image.asset(
            //   "assets/images/miu.png", width: 100.0, height: 100.0,
            // ),
          
            
            Container(
            margin: EdgeInsets.only(right: 120,top: 20),
             child: Row(
                children: <Widget>[
                 
               FittedBox(
                 
            child: GestureDetector(
                  
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                            return Admindashboard();
                        },
                      ));
                    },
                    child: Container(
                      
                     height: 200,
                     width: 200,
                      //margin: EdgeInsets.all(30),
                      margin: EdgeInsets.only(top: 30,left: 50,right:40),
                      //padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        
                        border: Border.all(color: Colors.black),
                        image: DecorationImage( 
                        image: AssetImage("assets/images/schedule-1024x605.jpg"),                       
                        //assets/images/Technologyconnectiondigitaldataabstractbackgroundsimplefuturisticmoderngeometricconnectionlinebackgroundvector1.png
                        fit: BoxFit.fitWidth,
                        
                      ),
                      
                        color:Color(0x4A4646).withOpacity(1),
                            //FF0E3311
                        borderRadius: BorderRadius.circular(25),
                        //color: Colors.red,
                      ),
                      alignment: Alignment.bottomCenter,
                        child:Text("View schedule",
                        style: TextStyle(
                          color: Colors.white,
                          //backgroundColor: Colors.yellow,
                          
                          ),),
                    ),
                    
                  ),
               ),
               FittedBox(
            child: GestureDetector(
                  
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                            return Admindashboard();
                        },
                      ));
                    },
                    child: Container(
                     height: 200,
                     width: 200,
                      //margin: EdgeInsets.all(30),
                      margin: EdgeInsets.only(top: 30,left: 45,right:20),
                      //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      decoration: BoxDecoration(
                         border: Border.all(color: Colors.black),
                         image: DecorationImage(
                           
                      image: NetworkImage("assets/images/shutterstock_1377586205-e1589987671595.jpg"),
                        //assets/images/Technologyconnectiondigitaldataabstractbackgroundsimplefuturisticmoderngeometricconnectionlinebackgroundvector1.png
                        fit: BoxFit.fitWidth,
                      ),
                                         color:Color(0x4A4646).withOpacity(1),
                            //FF0E3311
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.bottomCenter,
                        child:Text("Proctoring",
                        style: TextStyle(
                          color: Colors.white,
                          //backgroundColor: Colors.yellow,
                          
                          ),),
                      // child: Row(
                        
                      //   children: <Widget>[
                      //     Text(
                      //       "view schedule",
                      //       style: Theme.of(context).textTheme.button!.copyWith(
                      //             color: Colors.black,
                      //           ),
                      //     ),
                      //     //SizedBox(width: 200),
                      //     const Icon(
                      //       Icons.arrow_forward,
                      //       color: Colors.black,
                      //     )
                      //   ],
                      // ),

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
                    ),
          ),
          
               
              
              ],
              
                
            ),
          
        bottomNavigationBar: BottomNavigationBar(
          //currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.transparent,
          selectedFontSize: 22,
          unselectedFontSize: 15,
          selectedItemColor: Colors.red.shade800,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.red.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
                backgroundColor: Colors.red.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Q/A",
                backgroundColor: Colors.red.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: "Rate us",
                backgroundColor: Colors.red.shade800),
          ],
          onTap: (index) {
            // setState(() {
            //  // _selectedIndex = index;
            // });
          },
        )
      );
    
  }
}

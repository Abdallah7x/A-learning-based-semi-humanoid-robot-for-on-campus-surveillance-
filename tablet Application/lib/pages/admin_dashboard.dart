// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class admin_dash extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Editable Table',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: admin_dashboard(),
//     );
//   }
// }

// class admin_dashboard extends StatefulWidget {
//   @override
//   _admin_dashboardState createState() => _admin_dashboardState();
// }

// class _admin_dashboardState extends State<admin_dashboard> {
//   List rows = [
//     {
//       "name": 'James Peter',
//       "date": '01/08/2007',
//       "month": 'March',
//       "status": 'beginner'
//     },
//     {
//       "name": 'Okon Etim',
//       "date": '09/07/1889',
//       "month": 'January',
//       "status": 'completed'
//     },
//     {
//       "name": 'Samuel Peter',
//       "date": '11/11/2002',
//       "month": 'April',
//       "status": 'intermediate'
//     },
//     {
//       "name": 'Udoh Ekong',
//       "date": '06/3/2020',
//       "month": 'July',
//       "status": 'beginner'
//     },
//     {
//       "name": 'Essien Ikpa',
//       "date": '12/6/1996',
//       "month": 'June',
//       "status": 'completed'
//     },
//   ];

//   List headers = [
//     {"title": 'Date', 'index': 2, 'key': 'date'},
//     {"title": 'Date', 'index': 2, 'key': 'date'},
//     {"title": 'Month', 'index': 3, 'key': 'month'},
//     {"title": 'Status', 'index': 4, 'key': 'status'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Editable(
//         columns: headers,
//         rows: rows,
//         showCreateButton: true,
//         tdStyle: TextStyle(fontSize: 20),
//         showSaveIcon: false,
//         borderColor: Colors.grey.shade300,
//         onSubmitted: (value) {
//           //new line
//           print(value); //you can grab this data to store anywhere
//         },
//         onRowSaved: (value) {
//           //added line
//           print(value); //prints to console
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewsDemo extends StatefulWidget {
  @override
  _ReviewsDemoState createState() => _ReviewsDemoState();
}

class _ReviewsDemoState extends State<ReviewsDemo> {
  int selectedValue1;
  int selectedValue2;
  int selectedValue3;

  void onChange1(int value) {
    setState(() {
      selectedValue1 = value;
    });
  }

  void onChange2(int value) {
    setState(() {
      selectedValue2 = value;
    });
  }

  void onChange3(int value) {
    setState(() {
      selectedValue3 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade800,
        title: Text("Help us improve"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'How was the service you received?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 20),
              ReviewSlider(
                optionStyle: TextStyle(
                  color: Colors.red.shade800,
                  fontWeight: FontWeight.bold,
                ),
                onChange: onChange1,
              ),
              Text(
                selectedValue1.toString(),
                style: TextStyle(color: Colors.red.shade800),
              ),
              SizedBox(height: 20),
              Text(
                'Quality of our product?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 20),
              ReviewSlider(
                optionStyle: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
                onChange: onChange2,
                initialValue: 1,
              ),
              Text(selectedValue2.toString(),
                  style: TextStyle(color: Colors.orange)),
              SizedBox(height: 20),
              Text(
                'User friendly',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 20),
              ReviewSlider(
                optionStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                onChange: onChange3,
                initialValue: 3,
              ),
              Text(selectedValue3.toString(),
                  style: TextStyle(color: Colors.black)),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('rating').add({
                      'q1': selectedValue1,
                      'q2': selectedValue2,
                      'q3': selectedValue3,
                    });
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class navigation extends StatefulWidget {
  @override
  _navigationState createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  List<dynamic> buildings = [];

  List<dynamic> statemasters = [];
  List<dynamic> state = [];

  String? buildingid;
  String? stateid;
  @override
  void initState() {
    super.initState();
    this.buildings.add({"id": 1, "name": "Main building"});
    this.buildings.add({"id": 2, "name": "Pharmacy"});
    this.buildings.add({"id": 3, "name": "S building"});
    this.buildings.add({"id": 4, "name": "N building"});
    this.buildings.add({"id": 5, "name": "R building"});

    this.statemasters = [
      ({"id": 1, "name": "Pharmacy", "parentid": 1}),
      ({"id": 2, "name": "S building", "parentid": 1}),
      ({"id": 3, "name": "N building", "parentid": 1}),
      ({"id": 4, "name": "R building", "parentid": 1}),
      ({"id": 1, "name": "Main building", "parentid": 2}),
      ({"id": 2, "name": "S building", "parentid": 2}),
      ({"id": 3, "name": "N building", "parentid": 2}),
      ({"id": 4, "name": "R building", "parentid": 2}),
      ({"id": 1, "name": "Pharmacy", "parentid": 3}),
      ({"id": 2, "name": "Main building", "parentid": 3}),
      ({"id": 3, "name": "N building", "parentid": 3}),
      ({"id": 4, "name": "R building", "parentid": 3}),
      ({"id": 1, "name": "Main building", "parentid": 4}),
      ({"id": 2, "name": "S building", "parentid": 4}),
      ({"id": 3, "name": "Pharmacy", "parentid": 4}),
      ({"id": 4, "name": "R building", "parentid": 4}),
      ({"id": 1, "name": "Main building", "parentid": 5}),
      ({"id": 2, "name": "S building", "parentid": 5}),
      ({"id": 3, "name": "N building", "parentid": 5}),
      ({"id": 4, "name": "Pharmacy", "parentid": 5}),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Campus Navigation"),
          backgroundColor: Colors.red.shade800,
        ),
        body: Column(
          children: [
            Container(
              height: 220,
              width: 1280,
              child: Image.asset(
                "assets/images/img2.jpg",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            FormHelper.dropDownWidgetWithLabel(
              context,
              "Select Starting point",
              "Select Starting point",
              this.buildingid,
              this.buildings,
              (onChangedVal) {
                this.buildingid = onChangedVal;
                print("selected building: $onChangedVal");
                this.state = this
                    .statemasters
                    .where(
                      (StateItem) =>
                          StateItem["parentid"].toString() ==
                          onChangedVal.toString(),
                    )
                    .toList();
                this.stateid = null;
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Please Select a starting point';
                }

                return null;
              },
              borderFocusColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "name",
            ),
            SizedBox(
              height: 30,
            ),
            FormHelper.dropDownWidgetWithLabel(
              context,
              "Select destination",
              "Select destination",
              this.stateid,
              this.state,
              (onChangedVal) {
                this.stateid = onChangedVal;
                print("selected destination: $onChangedVal");
              },
              (onValidateVal) {
                return null;
              },
              borderFocusColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "name",
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              child: Text('Navigate me'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigation()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade800,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

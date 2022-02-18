import 'package:flutter/cupertino.dart';

class navigation_model extends StatefulWidget {
  @override
  _navigation_modelState createState() => _navigation_modelState();
}

class _navigation_modelState extends State<navigation_model> {
  List<dynamic> buildings = [];

  List<dynamic> statemasters = [];
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
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

import 'package:tablet/data/users.dart';
import 'package:tablet/model/user.dart';
import 'package:tablet/widget/scrollable_widget.dart';
import 'package:flutter/material.dart';

class SortablePage extends StatefulWidget {
  @override
  _SortablePageState createState() => _SortablePageState();
}

class _SortablePageState extends State<SortablePage> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;
   void _doSomething() {
    showAlertDialog(context);
  }

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Student Name', 'ID', 'Ticket Date', 'Ticket type'];

    return Column(children: [
      Container(
        width: 1250,
        child: DataTable(
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columns: getColumns(columns),
          rows: getRows(users),
        ),
      ),
    ]);
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [
          user.firstName,
          user.ID,
          user.Ticketdate,
          user.Tickettype
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.firstName, user2.firstName));
    } else if (columnIndex == 1) {
      users
          .sort((user1, user2) => compareString(ascending, user1.ID, user2.ID));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) => compareString(
          ascending, '${user1.Ticketdate}', '${user2.Ticketdate}'));
    } else if (columnIndex == 3) {
      users.sort((user1, user2) => compareString(
          ascending, '${user1.Tickettype}', '${user2.Tickettype}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  
  AlertDialog alert = AlertDialog(
      title: Center(child: Text('Student Ticket')),
      content: Row(
        children: [
          Container(
            height: 400,
            width: 370,
            child: Image.asset(
              "assets/images/ss.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Text("student name: Seif Ahmed"),
              Text("student ID: 2018/1xxx"),
              SizedBox(
                height: 30,
              ),
              Text("Ticket type:  Smoking"),
              SizedBox(
                height: 5,
              ),
              Text("Ticket Date: 20/2/2022"),
              SizedBox(
                height: 5,
              ),
              Text("Ticket time:2:32 PM"),
              SizedBox(
                width: 500,
              ),
            ],
          ),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
}
}

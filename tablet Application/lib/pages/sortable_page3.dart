import 'package:tablet/data/users.dart';
import 'package:tablet/model/user.dart';
import 'package:tablet/pages/ticket.dart';
import 'package:tablet/widget/scrollable_widget.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'Navigation.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

class SortablePage3 extends StatefulWidget {
  @override
  _SortablePage3State createState() => _SortablePage3State();
}

class _SortablePage3State extends State<SortablePage3> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;
  void _doSomething() {
    showAlertDialog(context);
  }

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers3);
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

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(Text('$data'), onTap: () {
            _doSomething();
          }))
      .toList();

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

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Add to log file"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.55),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      title: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.red.shade800,
        child: Padding(
          padding: const EdgeInsets.all(4), // Border radius
          child: ClipOval(child: Image.asset('assets/logo/miul.png')),
        ),
      ),
      content: Row(
        children: [
          SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                child: FlutterTicketWidget(
                  width: 320.0,
                  height: 415.0,
                  isCornerRounded: true,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'MIU',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.flight_takeoff,
                                    color: Colors.pink,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'university',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Student Ticket',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Column(
                            children: <Widget>[
                              ticketDetailsWidget(
                                  'Name', 'Seif Ahmed', 'Date', '20-2-2022'),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, right: 40.0),
                                child: ticketDetailsWidget(
                                    'Type', 'Smoking indoors', 'Time', '1:32'),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromHeight(150),
                                  // Image radius
                                  child: Image.asset('assets/images/ss.jpeg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 40,
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

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

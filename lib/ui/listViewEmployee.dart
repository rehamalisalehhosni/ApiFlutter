import 'package:appnew/Util/employeeDatatbaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appnew/ui/employeeScreen.dart';
import 'package:appnew/model/employee.dart';

class ListViewEmployee extends StatefulWidget {
  @override
  _ListViewEmployeeState createState() => _ListViewEmployeeState();
}

class _ListViewEmployeeState extends State<ListViewEmployee> {
  List<Employee> items = new List();
  EmployeeDatatbaseHelper db = new EmployeeDatatbaseHelper();
  @override
  void initState() {
    super.initState();
    db.getAllEmployee().then((employees) {
      setState(() {
        employees.forEach((employee) {
          items.add(Employee.fromMap(employee));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, position) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: new Text(
                        '${items[position].name}',
                        style: new TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: new Text(
                        '${items[position].department} - ${items[position].id} - ${items[position].age}- ${items[position].description} ',
                        style: new TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                        ),
                      ),
                      leading: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            child: new Text(
                              '${items[position].id}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                            backgroundColor: Colors.deepOrange,
                            radius: 18.0,
                          ),
                        
                        ],
                        
                      ),
                      trailing:   IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => _deleteEmployee(
                                context, items[position], position),
                          ),
                      
                      onTap: () => _navigateEmployee(context, items[position]),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _createNewEmployee(context),
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
        ));
  }

  _deleteEmployee(BuildContext context, Employee employee, int position) async {
    db.deleteEmployee(employee.id).then((employees) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  _navigateEmployee(BuildContext context, Employee employee) async {
    String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => EmployeeScreen(employee)));
    if (result == 'update') {
      db.getAllEmployee().then((employees) {
        setState(() {
          items.clear();
          employees.forEach((employee) {
            items.add(Employee.fromMap(employee));
          });
        });
      });
    }
  }

  _createNewEmployee(BuildContext context) async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EmployeeScreen(Employee('', '', '', '', ''))));
    if (result == 'save') {
      db.getAllEmployee().then((employees) {
        setState(() {
          items.clear();
          employees.forEach((employee) {
            items.add(Employee.fromMap(employee));
          });
        });
      });
    }
  }
}

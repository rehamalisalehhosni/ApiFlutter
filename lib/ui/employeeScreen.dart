import 'package:appnew/Util/employeeDatatbaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appnew/model/employee.dart';

class EmployeeScreen extends StatefulWidget {
  final Employee employee;
  EmployeeScreen(this.employee);
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  EmployeeDatatbaseHelper db = new EmployeeDatatbaseHelper();
  // TextEditingController _idController;
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _departmentController;
  TextEditingController _ageController;
  TextEditingController _descriptionController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  idController=new TextEditingController(text: widget.employee.id);
    _nameController = new TextEditingController(text: widget.employee.name);
    _emailController = new TextEditingController(text: widget.employee.email);
    _departmentController =
        new TextEditingController(text: widget.employee.department);
    _ageController = new TextEditingController(text: widget.employee.age);
    _descriptionController =
        new TextEditingController(text: widget.employee.description);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: new Text('Add New Employee'),),
        body: Container(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration:
                    InputDecoration(labelText: 'Name', icon: Icon(Icons.person)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(
                controller: _emailController,
                decoration:
                    InputDecoration(labelText: 'Email', icon: Icon(Icons.email)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(
                controller: _departmentController,
                decoration: InputDecoration(
                    labelText: 'Department', icon: Icon(Icons.departure_board)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(
                    labelText: 'Age', icon: Icon(Icons.view_agenda)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description', icon: Icon(Icons.description)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              RaisedButton(
                onPressed: (){
                  if(widget.employee.id!=null){
                    db.updateEmployee(Employee.fromMap({
                      'id':widget.employee.id,
                      'name':_nameController.text,
                      'description':_descriptionController.text,
                      'email':_emailController.text,
                      'age':_ageController.text,
                      'department':_departmentController.text,
                    })).then((_){
                          Navigator.pop(context,'update');
                    });
                  }else{
                         db.saveEmployee(
                             Employee( _nameController.text, _emailController.text, _departmentController.text,
                              _ageController.text, _descriptionController.text)
                          
                         ).then((_){
                          Navigator.pop(context,'save');
                         });
                  }
                },
                child: (widget.employee.id!=null)?Text('update'):Text('save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

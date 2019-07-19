import 'package:flutter/material.dart';
import 'package:appnew/partial/_drawer.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
 
  TextEditingController _firstNameController=new TextEditingController();
  TextEditingController _lastNameController=new TextEditingController();
  TextEditingController _ageNameController=new TextEditingController();
  TextEditingController _commentNameController=new TextEditingController();
  int _groupValue = 0;
  String type = '';
  String userinfo='';
  _handleChange(int value) {
    setState(() {
      _groupValue = value;
    });
    switch (_groupValue) {
      case 0:
        type = 'Male';
        print(type);
        break;
      case 1:
        type = 'Female';
        print(type);
        break;
      default:
    }
  }
  pressedBtn(){
    setState(() {
        if(_firstNameController.text.trim().isNotEmpty){
          userinfo='firstname: ${_firstNameController.text}';
        }
        if(_lastNameController.text.trim().isNotEmpty){
          userinfo+='Lastname: ${_lastNameController.text}';
        }
        if(_ageNameController.text.trim().isNotEmpty){
          userinfo+='Age : ${_ageNameController.text}';
        }
        if(_commentNameController.text.trim().isNotEmpty){
          userinfo+='Comment : ${_commentNameController.text}';
        }   
         if(type.isNotEmpty){
          userinfo+='Gender : $type ';
        } else{
          userinfo+='Gender : Male ';
        }  

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      drawer: drawer(context),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: new ListView(
          children: <Widget>[
            new Text('Form'),
            new TextField(
              controller: _firstNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Please Enter Name',
                icon: new Icon(Icons.person),
                labelText: 'Name',
              ),
            ),
            new TextField(
              controller: _lastNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Please Enter Last Name',
                icon: new Icon(Icons.person),
                labelText: 'Last Name',
              ),
            ),
            new TextField(
              controller: _ageNameController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Please Enter Age Name',
                icon: new Icon(Icons.person),
                labelText: 'Age',
              ),
            ),
            new Row(
              children: <Widget>[
                new Text('Male'),
                new Radio(
                  value: 0,
                  onChanged: _handleChange,
                  groupValue: _groupValue,
                  activeColor: Colors.blueGrey,
                ),
                new Text('Female'),
                new Radio(
                  value: 1,
                  onChanged: _handleChange,
                  groupValue: _groupValue,
                  activeColor: Colors.pink,
                ),
              ],
            ),
            new TextField(
              controller: _commentNameController,
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Please Enter Comment',
                icon: new Icon(Icons.person),
                labelText: 'Comment',
              ),
            ),
           new RaisedButton(
             onPressed: pressedBtn,
             color: Colors.purple,
             child: new Text('submit',style: TextStyle(color: Colors.white),),
           ),
           new Text('${userinfo}'),
          ],
        ),
      ),
    );
  }


}

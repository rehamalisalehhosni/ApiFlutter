class Employee {
  int _id;
  String _name;
  String _email;
  String _department;
  String _age;
  String _description;

  Employee( this._name, this._email, this._department, this._age,
      this._description);
  Employee.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._email = obj['email'];
    this._department = obj['department'];
    this._age = obj['age'];
    this._description = obj['description'];
  }

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get department => _department;
  String get age => _age;
  String get description => _description;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['email'] = _email;
    map['department'] = _department;
    map['age'] = _age;
    map['description'] = _description;

    return map;
  }

  Employee.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._email = map['email'];
    this._department = map['department'];
    this._age = map['age'];
    this._description = map['description'];

  }
}

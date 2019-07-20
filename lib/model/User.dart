class User{
 
   int id ;
   String name ;
   String email ;
   String password ;
   User(this.email,this.id,this.name,this.password);
   User.map(dynamic obj){
     this.id=obj['id'];
     this.name=obj["name"];
     this.email=obj["email"];
     this.password=obj["password"];
   }
 
 int get _id =>id;
 String get _name =>name;
 String get _email =>email;
 String get _password =>password;

 Map<String , dynamic> toMap(){
   var map=new Map <String , dynamic>();
   if(_id!=null){
     map["id"]=_id;
   }
   map["name"]=_name;
   map["email"]=_email;
   map["password"]=_password;
   return map;

 }

 User.fromMap(Map <String , dynamic>map){
     this.id=map['id'];
     this.name=map["name"];
     this.email=map["email"];
     this.password=map["password"]; }
}
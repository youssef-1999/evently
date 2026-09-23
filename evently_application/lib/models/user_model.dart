class UserModel {
  String? uid;
  final String? name;
  final String email;
  final String password;

  UserModel({ this.name, this.uid, required this.email, required this.password});

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'email': email,
      'uid': uid,

    };

  }
 static UserModel fromJson(Map<String, dynamic> json){
   return UserModel(
     name: json['name'],
     email: json['email'],
     password: json['password'] ?? '',
     uid: json['uid'],
   );
 }
}
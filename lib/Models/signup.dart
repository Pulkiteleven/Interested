class SignUpModel{
  String? uid;
  String? email;
  String? name;
  String? password;
  String? cpassword;

  SignUpModel({this.uid,this.email,this.name,this.password,this.cpassword});

  factory SignUpModel.fromMap(map){
    return SignUpModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      password: map['password'],
      cpassword: map['cpassword']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid' : uid,
      'email' : email,
      'name' : name,
      'password' : password,
    };

  }
}
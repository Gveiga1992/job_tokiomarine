import 'package:firebase_auth/firebase_auth.dart';

class UserSignUpModel {
  String? id;
  String? name;
String? cpf;
  String? email;
  String? urlImage;

  UserSignUpModel({this.id, this.name, this.email, this.urlImage});

  UserSignUpModel.fromSnapshot(User? json)
      : id = json!.uid,
        name = json.displayName,
        email = json.email,
        urlImage = json.photoURL;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "cpf": cpf,
      "email": email,
      "urlImage": urlImage,
    };
  }
}

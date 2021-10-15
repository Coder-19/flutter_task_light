// The code below is used to create a class to act as the
// model for getting the properties of all our users
class UserModel {
  // the property below is used to get the id
  int? id;
  // the property below is used to get the name of the user
  String? userName;
  // the property below is used to get the email of the user
  String? userEmail;
  // the property below is used to get the password of the
  // user
  String? userPassword;

  UserModel({
    this.id,
    this.userName,
    required this.userEmail,
    required this.userPassword,
  });

  // the code below is used to convert the data from json map
  // to dart object
  UserModel.fromMap(Map<String, dynamic> res) {
    UserModel(
      id: res['id'],
      userName: res['name'],
      userEmail: res['email'],
      userPassword: res['password'],
    );
  }

  // the code below is used to create a method to convert the
  // dart object to json map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': userName,
      'email': userEmail,
      'password': userPassword,
    };
  }
}

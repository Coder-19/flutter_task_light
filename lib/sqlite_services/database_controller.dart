// the code beow is used to create a class for acting as a
// controller  for our database
import 'package:flutter_task_light/models/user_model.dart';
import 'package:flutter_task_light/screens/dashboard.dart';
import 'package:flutter_task_light/screens/signup_screen.dart';
import 'package:flutter_task_light/sqlite_services/database.dart';
import 'package:get/get.dart';

class DatabaseController {
  // the code below is used to create a method for
  // saving the data of the user to the database
  Future<int> insertUser(UserModel user) async {
    // the code below is used to get access to the database
    final dbClient = await TaskLightDatabase().db;

    // the code below is used to insert the data to the database
    var result = await dbClient.insert('users', user.toMap());

    // the line of code below is for debugging purpose
    print(
        "The value of result after inserting the data in the database: $result");

    // the below line of code is used to return the result
    return result;
  }

  // the code below is used to get the data from the database
  Future<List<UserModel>> getData() async {
    // the code below is used to get the access to the database
    final dbClient = await TaskLightDatabase().db;

    // the code below is used to get the list of users from the
    // database
    final List<Map<String, Object?>> queryResult =
        await dbClient.query('users');

    // the code below is used to print the first data from the database
    print("The details of the user are: ${queryResult.first}");

    // the code below is used to return the data present in the
    // queryResult list
    return queryResult.map((e) {
      // the below line of code is for debugging purpose
      print("The data present in the database is: \n $e");
      return UserModel.fromMap(e);
    }).toList();
  }

  // the code below is used to create a method to check if a user
  // with the email and password exists in the database or not
  Future checkUser(String email, String password) async {
    // the code below is usedto get access to the database
    var dbClient = await TaskLightDatabase().db;

    var result = dbClient.rawQuery(
        """SELECT id FROM users WHERE email = '$email' AND password = '$password';""");

    // // the below line of code is for debugging purpose
    // final List<Map<String, Object?>> queryResult =
    //     await dbClient.query('users');

    // queryResult.map((e) {
    //   // the below line of code is for debugging purpose
    //   print("The data: \n $e");
    //   return UserModel.fromMap(e);
    // }).toList();

    // var res;

    result.then((value) {
      print(value);
      if (value.isEmpty) {
        Get.to(const SignupScreen());
      } else {
        // return true;
        Get.to(const DashboardScreen());
      }
    });

    // return result;

    // print(res);

    // return res;
  }
}

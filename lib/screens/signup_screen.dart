import 'package:flutter/material.dart';
import 'package:flutter_task_light/models/user_model.dart';
import 'package:flutter_task_light/screens/login_screen.dart';
import 'package:flutter_task_light/sqlite_services/database_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// the code below is used to create the signup screen of the app
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // the proeprty below is used to get the name of the user
  String? userName;

  // the property below is used to get the email address of the
  // user
  String? userEmail;

  // the property below is used to get the password of the user
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    labelText: "Name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });

                    // the below line of code is for debugging purpose
                    print("The name entered by the user: $userName");
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userEmail = value;
                    });

                    // the below line of code is for debugging purpose
                    print("The email entered by the user: $userEmail");
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                    suffixIcon: Icon(
                      FontAwesomeIcons.eye,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });

                    // the below line of code is for debugging purpose
                    print("The password entered by the user: $password");
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // the code below is used to create the login button
                GestureDetector(
                  onTap: () async {
                    // the code below is used to create an instance
                    // of the database controller
                    DatabaseController controller = DatabaseController();

                    // the code below is used to create an instance of
                    // the user model class and saving data to it
                    UserModel model = UserModel(
                      userEmail: userEmail,
                      userPassword: password,
                      userName: userName,
                    );

                    // the code below is to use the insert user method
                    // to save the data to the database
                    controller.insertUser(model);
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.orangeAccent,
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Already have an account",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // the code below is used to create the signup
                // button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // the code below is used to go to the
                      // Login screen of the app
                      Get.to(const LoginScreen());
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

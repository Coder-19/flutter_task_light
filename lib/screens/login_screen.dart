import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_task_light/screens/signup_screen.dart';
import 'package:flutter_task_light/sqlite_services/database_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// the code below is used to create the login screen of the app
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // the property below is used to get the email address of the
  // user
  String? userEmail;

  // the property below is used to get the password of the user
  String? password;

  @override
  Widget build(BuildContext context) {
    // the code below is used to create an instance of the database
    // controller
    DatabaseController controller = DatabaseController();
    // the code below is used to get the details of the user
    // using the getData method
    controller.getData();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/background.jpeg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // the code below is used to create a container for the
                  // login details
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.07,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 50.0,
                              ),
                              const Text(
                                "Welcome Fashionista!",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                "Sign in to continue",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                  print(
                                      "The email entered by the user: $userEmail");
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
                                  print(
                                      "The password entered by the user: $password");
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              // the code below is used to create the login button
                              GestureDetector(
                                onTap: () {
                                  DatabaseController controller =
                                      DatabaseController();

                                  controller.checkUser(userEmail.toString(),
                                      password.toString());
                                  // print(controller.checkUser(userEmail.toString(),
                                  //     password.toString()));
                                },
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.orangeAccent,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Log In",
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
                                    "Forgot Password?",
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
                                    // signup screen of the app
                                    Get.to(const SignupScreen());
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
                                        "Sign up",
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

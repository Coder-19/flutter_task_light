import 'package:flutter/material.dart';
import 'package:flutter_task_light/screens/login_screen.dart';
import 'package:flutter_task_light/sqlite_services/database.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // the code below is used to initialize the sqlite db
  final db = TaskLightDatabase();

  // the code below is used to count the number of tables in the
  // database
  await db.countTable();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task Light',
      home: LoginScreen(),
    );
  }
}

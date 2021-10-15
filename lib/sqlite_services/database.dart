// the code below is used to create a class for initializing
// the database
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TaskLightDatabase {
  // the code below is used to create an instance of the database
  static final TaskLightDatabase _instance = TaskLightDatabase.internal();

  // the code below is used to create the interal method
  TaskLightDatabase.internal();

  factory TaskLightDatabase() => _instance;

  // the code below is used to create an instance of database
  static Database? _db;

  // the code below is used to create a getter for getting the
  // database
  Future<Database> get db async {
    // the code below is used to check that if the db is not
    // null then returning the db else creating a new db and
    // then returning it
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  // the code below is used to create a method to initialize the
  // database
  initDb() async {
    // the code below is used to get the application directory
    // for storing the db
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    // the code below is used for creating the path where the db is stored
    String path = join(documentDirectory.path, "taskLight.db");

    // the code below is used to open the database
    var taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,email TEXT NOT NULL,password TEXT NOT NULL)",
        );
      },
    );

    return taskDb;
  }

  // the code below is used to count the number of tables present  in the
  // database
  Future countTable() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      """ SELECT count(*) as count FROM sqlite_master
    WHERE type = 'table'
    AND name != 'android_metadata' 
    AND name != 'sqlite_sequence';""",
    );

    // the below line of code is for debugging purpose
    print("The number of tables in the database are: ${result[0]['count']}");

    // the code below is used to return the result
    return result[0]['count'];
  }
}

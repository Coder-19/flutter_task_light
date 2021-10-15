import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task_light/models/dashboard_model.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // the code below is used to get the data from the api
  Future<List<DashboardModel>> sendDataToAPI(int pageNumber) async {
    http.Response response = await http.post(
      Uri.parse(
          "https://www.devops.tileswale.com/api/v26/company_list_by_category"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'mode': "listing",
        'page': pageNumber,
      }),
    );

    // if the status code is 201 the returning the body of the
    // api else returning the error
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body)['results'];

      print(map);

      List<dynamic> data = map['data'];

      print(data);
      // the below line of code is for debugging purpose
      print(response.body);

      return data.map((e) => DashboardModel.fromJson(e)).toList();
    } else {
      print(response.body);
      throw "Cannot get the data from the api";
    }
  } 

  @override
  Widget build(BuildContext context) {
    sendDataToAPI(1);
    return Scaffold(
      body: Container(),
    );
  }
}

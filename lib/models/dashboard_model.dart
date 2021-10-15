// the code below is used to create a class for getting the
// properties for showing the data in the dashboard screen
class DashboardModel {
  // the property below is used to get the url of the image
  String? imageUrl;

  // the property below is used to get the name
  String? name;

  DashboardModel({
    this.imageUrl,
    this.name,
  });

  // the code below is used to convert the json data to the dart
  // object
  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      imageUrl: json['company_logo'],
      name: json['company_name'],
    );
  }
}

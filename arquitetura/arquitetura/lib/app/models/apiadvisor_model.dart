class ApiadvisorModel {
  String? main;
  String? description;
  String? name;

  ApiadvisorModel({this.main, this.description, this.name});

  ApiadvisorModel.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main'] = this.main;
    data['description'] = this.description;
    data['name'] = this.name;
    return data;
  }
}

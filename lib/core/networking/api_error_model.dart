class ApiErrorModel {
  String? message;
  int? status;

  ApiErrorModel({this.message, this.status});

  ApiErrorModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
  }
}

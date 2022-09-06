class AdminNotification {
  AdminNotification(
      {this.id,
      required this.name,
      required this.message,
      required this.isChecked});
  int? id;
  String name;
  String message;
  bool isChecked;

  factory AdminNotification.fromJson(Map<String, dynamic> json) =>
      AdminNotification(
        id: json["id"],
        name: json["name"],
        message: json["message"],
        isChecked: json["isChecked"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "message": message,
        "isChecked": isChecked ? 1 : 0
      };
}

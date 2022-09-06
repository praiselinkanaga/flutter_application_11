// List<Tickets> ticketsFromJson(String str) =>
//     List<Tickets>.from(json.decode(str).map((x) => Tickets.fromJson(x)));

// String ticketsToJson(List<Tickets> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tickets {
  Tickets({
    required this.ticketId,
    required this.createdAt,
    required this.taskName,
    required this.companyName,
    required this.userName,
    required this.priorityStatus,
    required this.status,
  });

  String ticketId;
  DateTime createdAt;
  String taskName;
  String companyName;
  String userName;
  PriorityStatus priorityStatus;
  Status status;

  factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        ticketId: json["ticketId"],
        createdAt: DateTime.parse(json["created_at"]),
        taskName: json["taskName"],
        companyName: json["companyName"],
        userName: json["userName"],
        priorityStatus: PriorityStatus.fromJson(json["priorityStatus"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "ticketId": ticketId,
        "created_at": createdAt.toIso8601String(),
        "taskName": taskName,
        "companyName": companyName,
        "userName": userName,
        "priorityStatus": priorityStatus.toJson(),
        "status": status.toJson(),
      };
}

class PriorityStatus {
  PriorityStatus({
    required this.priorityStatusName,
    required this.priorityStatusId,
  });

  String priorityStatusName;
  String priorityStatusId;

  factory PriorityStatus.fromJson(Map<String, dynamic> json) => PriorityStatus(
        priorityStatusName: json["priorityStatusName"],
        priorityStatusId: json["priorityStatusId"],
      );

  Map<String, dynamic> toJson() => {
        "priorityStatusName": priorityStatusName,
        "priorityStatusId": priorityStatusId,
      };
}

class Status {
  Status({
    required this.statusName,
    required this.statusId,
  });

  String statusName;
  String statusId;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        statusName: json["statusName"],
        statusId: json["statusId"],
      );

  Map<String, dynamic> toJson() => {
        "statusName": statusName,
        "statusId": statusId,
      };
}

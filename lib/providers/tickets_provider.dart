import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/tickets.dart';
import 'package:flutter_application_11/services/ticket_services.dart';

class TicketProvider extends ChangeNotifier {
  List<Tickets>? tickets;
  bool loading = false;

  getTicketData() async {
    loading = true;
    tickets = (await TicketService().getData())!;
    loading = false;
    notifyListeners();
  }
}

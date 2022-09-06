import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_11/const.dart';
import 'package:flutter_application_11/models/tickets.dart';

class TicketService {
  Future<List<Tickets>>? getData() async {
    var response =
        await http.get(Uri.parse(Constants.baseUrl + Constants.userEndPoint));
    //jsonDecode(response.body);
    //debugPrint(response.body);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body);
      return (list as List).map((e) => Tickets.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}

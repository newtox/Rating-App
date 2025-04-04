import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<void> fetchRooms() async {
    final response = await http.get(Uri.parse('http://localhost:8080/rooms'));

    if (response.statusCode == 200) {
      List rooms = jsonDecode(response.body);
      print(rooms);
    } else {
      // Fehlerbehandlung
    }
  }
}

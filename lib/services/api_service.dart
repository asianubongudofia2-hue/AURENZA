import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  // Default to jsonplaceholder; replace with your real API base URL if available.
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<User>> fetchUsers() async {
    final uri = Uri.parse('$_baseUrl/users');
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final List<dynamic> body = json.decode(res.body);
      return body.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users: ${res.statusCode}');
    }
  }

  static Future<User> fetchUserById(int id) async {
    final uri = Uri.parse('$_baseUrl/users/$id');
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(res.body);
      return User.fromJson(body);
    } else {
      throw Exception('Failed to load user $id: ${res.statusCode}');
    }
  }
}

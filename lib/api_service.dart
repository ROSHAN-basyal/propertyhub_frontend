import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://10.0.2.2:8000"; // e.g. http://10.0.2.2:8000 for Android emulator

  static Future<int> signupUser(
    String username,
    String email,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/api/signup/'); // adjust your endpoint path

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return 1; // signup success
    }
    else if(response.statusCode==400){
      return 2;
    }
     else {
      return 3;
    }
  }

  static Future<int> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/login/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return 1; // login success
    }
     else if (response.statusCode == 401){
      return 2;
    }
    else {
      return 3;
    }
  }

static Future<int> forgetpw(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/forgetpw/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return 1; // pw changed
    }
    else {
      return 2;
    }
  }
}

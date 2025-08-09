import 'dart:convert';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;

class ApiService {
  static const String baseUrl =
      "http://127.0.0.1:8000"; // e.g. http://10.0.2.2:8000 for Android emulator

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


    // List jsonList = json.decode(response.body);
    // String user_id = jsonList[0]['user_id'];
    //
    // int status = jsonList[0]['status'];

    if (response.statusCode == 200 || response.statusCode == 201) {
      return 1; // signup success
    }
    else if(response.statusCode==400){
      return 2;
    }
     else {
      return response.statusCode;
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
      Map<String, dynamic> data = json.decode(response.body);
      // globals.user_id=data['user_id'];
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
    final url = Uri.parse('$baseUrl/api/users/api/forgetpw/');
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


  static Future<int> postProperty({
    required String areaLocation,
    required String propertyType,
    required String rent,
    required String contactNumber,
    String? description,
  }) async {
    final url = Uri.parse('$baseUrl/api/properties/addproperties/'); // your backend endpoint

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "area_location": areaLocation,
          "property_type": propertyType,
          "rent": rent,
          "contact_number": contactNumber,
          "description": description ?? "",
        }),
      );

      if (response.statusCode == 201) {
        return 1; // success
      } else {
        print("Error: ${response.body}");
        return 2; // failure
      }
    } catch (e) {
    print("Exception: $e");
    return 3; // network or other error
    }
  }

  static Future<List<dynamic>> fetchProperties() async {
    final url = Uri.parse('$baseUrl/api/properties/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
    throw Exception("Failed to load properties");
    }
  }
}


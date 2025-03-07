import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke';

  static Future<Map<String, dynamic>?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "API_Body": [{"Unique_Id": "", "Pw": password}],
        "Api_Action": "GetUserData",
        "Company_Code": username,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['Response_Body'][0]; // Extract user data
    } else {
      return null;
    }
  }
}

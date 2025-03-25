import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://vica.website/api/flutter';

  Future<Map<String, dynamic>> register(Map<String, String> data) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/register'));
    
    request.fields.addAll(data);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseBody = await response.stream.bytesToString();
      return json.decode(responseBody);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Map<String, dynamic>> verifyEmail(String email, int otp) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = http.Request('POST', Uri.parse('$baseUrl/verify-email'));
    request.body = json.encode({
      "email": email,
      "otp": otp,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return json.decode(responseBody); // Parse the response into a Map
    } else {
      throw Exception(response.reasonPhrase); // Handle error responses
    }
  }

  Future<Map<String, dynamic>> login(String email, String password, bool rememberMe) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('POST', Uri.parse('$baseUrl/login'));
    request.body = json.encode({
      "email": email,
      "password": password,
      "remember_me": rememberMe,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return json.decode(responseBody); // Parse the response into a Map
    } else {
      throw Exception(response.reasonPhrase); // Handle errors appropriately
    }
  }

  Future<String> logout(String token) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.Request('POST', Uri.parse('$baseUrl/logout'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString(); // Logout successful
    } else {
      throw Exception(response.reasonPhrase); // Handle errors
    }
  }
}
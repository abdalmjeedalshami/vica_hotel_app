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

  Future<String> deleteAccount(String token, String password) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.Request('DELETE', Uri.parse('$baseUrl/delete-account'));
    request.body = json.encode({"password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString(); // Success response
    } else {
      throw Exception(response.reasonPhrase); // Error response
    }
}

  Future<String> sendOtp(String email) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('POST', Uri.parse('$baseUrl/send-otp'));
    request.body = json.encode({"email": email});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString(); // Return server's response
    } else {
      throw Exception(response.reasonPhrase); // Handle any errors
}
  }

  Future<Map<String, dynamic>> verifyOtp(String email, int otp) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var request = http.Request('POST', Uri.parse('$baseUrl/verify-otp'));
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
      throw Exception(response.reasonPhrase); // Handle errors appropriately
    }
  }

  Future<String> changePassword(String token, String password, String passwordConfirmation) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.Request('PUT', Uri.parse('$baseUrl/change-password'));
    request.body = json.encode({
      "password": password,
      "password_confirmation": passwordConfirmation,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString(); // Return success message
    } else {
      throw Exception(response.reasonPhrase); // Handle errors
    }
  }

  Future<Map<String, dynamic>> getProfile(String token) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.Request('GET', Uri.parse('$baseUrl/profile'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return json.decode(responseBody)['data']; // Extract and return the "data" field
    } else {
      throw Exception(response.reasonPhrase); // Handle errors gracefully
    }
  }

  Future<Map<String, dynamic>> updateProfile(String token, Map<String, dynamic> profileData) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.Request('PUT', Uri.parse('$baseUrl/profile'));
    request.body = json.encode(profileData);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return json.decode(responseBody); // Parse and return the response
    } else {
      throw Exception(response.reasonPhrase); // Handle errors
    }
  }

  Future<String> uploadProfileImage(String token, String filePath) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/profile/image'));
    request.files.add(await http.MultipartFile.fromPath('profile_image', filePath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString(); // Success response
    } else {
      throw Exception(response.reasonPhrase); // Handle errors gracefully
    }
  }
}
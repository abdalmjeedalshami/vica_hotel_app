import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final box = Hive.box('authBox');

  bool emailCheck = false;

  void toggleEmailCheck(){
    emailCheck = !emailCheck;
    emit(EmailCheckToggled());
  }
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> register(Map<String, String> data) async {
    try {
      emit(AuthLoading());
      final response = await authService.register(data);
      emit(AuthSuccess('${response['message']}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyEmail(String email, int otp) async {
    try {
      emit(AuthLoading());
      final response = await authService.verifyEmail(email, otp);
      emit(AuthSuccess('${response['message']}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  String? token;
  String? imageUrl;

  Future<void> login(String email, String password, bool rememberMe) async {
    try {
      emit(AuthLoading());
      final response = await authService.login(email, password, rememberMe);

      // Extract relevant fields from the response
      final message = response['message'];
      final data = response['data'];

      token = response['data']['token'];
      final user = response['data']['user'];
      imageUrl = user['image_url'];

      box.put('isLoggedIn', true);
      box.put('userEmail', email);
      box.put('userToken', token);
      box.put('userImage', imageUrl);

      emit(AuthSuccess(message, data));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());

      String? token = box.get('userToken');

      if (token == null) throw Exception('Token not found');

      box.clear();

      emit(AuthSuccess('Logout success'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> deleteAccount(String password) async {
    try {
      emit(AuthLoading());

      String? token = box.get('userToken');

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to delete account
      final response = await authService.deleteAccount(token, password);
      final decodedResponse = jsonDecode(response);

      // Clear token after account deletion
      box.clear();

      emit(AuthSuccess('${decodedResponse['message']}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> sendOtp(String email) async {
    try {
      emit(AuthLoading());
      final response = await authService.sendOtp(email);
      final decodedResponse = jsonDecode(response);
      emit(AuthSuccess('${decodedResponse['message']}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyOtp(String email, int otp) async {
    try {
      emit(AuthLoading());
      final response = await authService.verifyOtp(email, otp);

      // Extract relevant fields from the response
      final message = response['message'];
      final data = response['data'];

      token = response['data']['token'];

      box.put('userToken', token);

      emit(AuthSuccess(message, data));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> changePassword(String password, String passwordConfirmation) async {
    try {
      emit(AuthLoading());

      final String? token = box.get('userToken');

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to change password
      final response = await authService.changePassword(token, password, passwordConfirmation);
      final decodedResponse = jsonDecode(response);
      emit(AuthSuccess('${decodedResponse['message']}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Map<String, dynamic>? user;

  Future<void> getProfile() async {
    try {
      emit(GetProfileLoading());

      final String? token = box.get('userToken');

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to fetch the profile
      final profileData = await authService.getProfile(token);
      user = profileData['user'];
      emit(GetProfileSuccess('Welcome', user));
    } catch (e) {
      emit(GetProfileFailure(e.toString()));
    }
  }

  Future<void> updateProfile(Map<String, dynamic> profileData) async {
    try {
      emit(AuthLoading());

      final String? token = box.get('userToken');

      if (token == null) throw Exception('Token not found');

      // Call AuthService to update profile
      final updatedData = await authService.updateProfile(token, profileData);
      final newUser = updatedData['data']['user']; // Update the stored user profile
      user!['first_name'] = newUser['first_name'];
      user!['last_name'] = newUser['last_name'];
      user!['user_name'] = newUser['user_name'];
      emit(AuthProfileUpdated('Profile updated successfully', user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  String profileImagePath = '';

  Future<void> uploadProfileImage(String filePath) async {
    try {
      emit(AuthLoading());

      final String? token = box.get('userToken');

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to upload profile image
      final response = await authService.uploadProfileImage(token, filePath);
      final decodedResponse = jsonDecode(response);
      profileImagePath = decodedResponse['data']['profile_image'];
      emit(AuthImageUploaded('${decodedResponse['message']}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

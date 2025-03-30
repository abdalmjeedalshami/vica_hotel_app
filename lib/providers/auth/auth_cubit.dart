import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  // final FlutterSecureStorage secureStorage = const FlutterSecureStorage(); // Secure storage instance

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> register(Map<String, String> data) async {
    try {
      emit(AuthLoading());
      final response = await authService.register(data);
      emit(AuthSuccess('Registration successful: ${response['message']}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyEmail(String email, int otp) async {
    try {
      emit(AuthLoading());
      final response = await authService.verifyEmail(email, otp);
      emit(AuthSuccess('Verification successful: ${response['message']}'));
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

      // await secureStorage.write(key: 'token', value: response['data']['token']);

      // Extract relevant fields from the response
      final message = response['message'];
      final data = response['data'];

      token = response['data']['token'];
      final user = response['data']['user'];
      imageUrl = user['image_url'];

      emit(AuthSuccess(message, data));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());

      if (token == null) throw Exception('Token not found');

      final response = await authService.logout(token!);

      token = null;

      emit(AuthSuccess('Logout successful: $response'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> deleteAccount(String password) async {
    try {
      emit(AuthLoading());

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to delete account
      final response = await authService.deleteAccount(token!, password);

      // Clear token after account deletion
      token = null;

      emit(AuthSuccess('Account deleted successfully: $response'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> sendOtp(String email) async {
    try {
      emit(AuthLoading());
      final response = await authService.sendOtp(email);
      emit(AuthSuccess('OTP sent successfully: $response'));
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

      emit(AuthSuccess(message, data));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> changePassword(String password, String passwordConfirmation) async {
    try {
      emit(AuthLoading());

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to change password
      final response = await authService.changePassword(token!, password, passwordConfirmation);
      emit(AuthSuccess('Password changed successfully: $response'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Map<String, dynamic>? user;

  Future<void> getProfile() async {
    try {
      emit(GetProfileLoading());

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to fetch the profile
      final profileData = await authService.getProfile(token!);
      user = profileData['user'];
      emit(GetProfileSuccess('Profile retrieved successfully', user));
    } catch (e) {
      emit(GetProfileFailure(e.toString()));
    }
  }

  Future<void> updateProfile(Map<String, dynamic> profileData) async {
    try {
      emit(AuthLoading());

      if (token == null) throw Exception('Token not found');

      // Call AuthService to update profile
      final updatedData = await authService.updateProfile(token!, profileData);
      final newUser = updatedData['data']['user']; // Update the stored user profile
      user!['first_name'] = newUser['first_name'];
      user!['last_name'] = newUser['last_name'];
      user!['user_name'] = newUser['user_name'];
      emit(AuthProfileUpdated('Profile updated successfully', user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> uploadProfileImage(String filePath) async {
    try {
      emit(AuthLoading());

      // Retrieve token from secure storage
      if (token == null) throw Exception('Token not found');

      // Call AuthService to upload profile image
      final response = await authService.uploadProfileImage(token!, filePath);
      emit(AuthImageUploaded('Image uploaded successfully: $response'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

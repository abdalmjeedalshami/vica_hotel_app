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

  Future<void> login(String email, String password, bool rememberMe) async {
    try {
      emit(AuthLoading());
      final response = await authService.login(email, password, rememberMe);

      // await secureStorage.write(key: 'token', value: response['data']['token']);

      // Extract relevant fields from the response
      final message = response['message'];
      final data = response['data'];

      emit(AuthSuccess(message, data));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;
  Map<String, dynamic>? data;
  AuthSuccess(this.message, [this.data]);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
abstract class AuthState {}

class AuthInitial extends AuthState {}

class EmailCheckToggled extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;
  Map<String, dynamic>? data;
  AuthSuccess(this.message, [this.data]);
}
class AuthProfileUpdated extends AuthState {
  final String message;
  Map<String, dynamic>? data;
  AuthProfileUpdated(this.message, [this.data]);
}
class AuthImageUploaded extends AuthState {
  final String message;
  Map<String, dynamic>? data;
  AuthImageUploaded(this.message, [this.data]);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

class GetProfileLoading extends AuthState {}
class GetProfileSuccess extends AuthState {
  final String message;
  Map<String, dynamic>? user;
  GetProfileSuccess(this.message, [this.user]);
}
class GetProfileFailure extends AuthState {
  final String error;
  GetProfileFailure(this.error);
}
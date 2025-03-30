import '../models/room_model.dart';

abstract class RoomState {}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<Room> rooms;

  RoomLoaded(this.rooms);
}
class RoomsAdded extends RoomState {}

class RoomError extends RoomState {
  final String message;

  RoomError(this.message);
}

class DatabaseDeleted extends RoomState {}

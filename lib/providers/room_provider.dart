import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/room_state.dart';
import '../models/room_model.dart';
import '../services/database_helper.dart';
import '../utils/images.dart';

class RoomCubit extends Cubit<RoomState> {
  final DatabaseHelper databaseHelper;

  RoomCubit(this.databaseHelper) : super(RoomInitial());

  List<Room> rooms = [];
  List<Room> booked = [];
  List<Room> past = [];

  void addSampleRooms(DatabaseHelper databaseHelper) async {
    List<Room> rooms = [
      Room(
        name: "Deluxe Suite",
        image: AppImages.room_1,
        price: 200.0,
        rate: 1,
        available: true,
        description: "A luxurious suite with stunning views.",
        images: [
          AppImages.room_1,
          AppImages.room_2,
          AppImages.room_3,
          AppImages.room_4
        ],
        tv: true,
        shower: true,
        wifi: false,
        breakfast: false,
      ),
      Room(
          name: "Ocean View",
          image: AppImages.room_2,
          price: 180.0,
          rate: 2,
          available: false,
          description: "Enjoy beautiful ocean views.",
          images: [
            AppImages.room_5,
            AppImages.room_6,
            AppImages.room_1,
            AppImages.room_4
          ],
          tv: true,
          shower: true,
          wifi: false,
          breakfast: false
          ),
      Room(
          name: "Mountain Retreat",
          image: AppImages.room_3,
          price: 150.0,
          rate: 3,
          available: true,
          description: "A cozy retreat in the mountains.",
          images: [
            AppImages.room_4,
            AppImages.room_3,
            AppImages.room_2,
            AppImages.room_1
          ],
          tv: true,
          shower: true,
          wifi: false,
          breakfast: false
          ),
      Room(
          name: "City Apartment",
          image: AppImages.room_4,
          price: 120.0,
          rate: 4,
          available: false,
          description: "A convenient apartment in the heart of the city.",
          images: [
            AppImages.room_2,
            AppImages.room_1,
            AppImages.room_6,
            AppImages.room_4
          ],
          tv: true,
          shower: true,
          wifi: false,
          breakfast: false
          ),
      Room(
          name: "Beach Bungalow",
          image: AppImages.room_5,
          price: 250.0,
          rate: 5,
          available: true,
          description: "A beautiful bungalow by the beach.",
          images: [
            AppImages.room_2,
            AppImages.room_3,
            AppImages.room_5,
            AppImages.room_4
          ],
          tv: true,
          shower: true,
          wifi: false,
          breakfast: false
          ),
    ];

    for (Room room in rooms) {
      await databaseHelper.insertRoom(room);
    }
    fetchRooms();
  }

  Future<void> fetchRooms() async {
    try {
      rooms.clear();
      booked.clear();
      past.clear();
      emit(RoomLoading());
      final allRooms = await databaseHelper.fetchRooms();
      for (Room room in allRooms) {
        room.status == 'booked'
            ? booked.add(room)
            : room.status == 'past'
                ? past.add(room)
                : rooms.add(room);
      }
      emit(RoomLoaded(rooms));
    } catch (e) {
      emit(RoomError('Failed to load rooms: $e'));
    }
  }

  Future<void> deleteDatabaseFile() async {
    try {
      await DatabaseHelper.deleteDatabaseFile();
      emit(DatabaseDeleted());
    } catch (e) {
      emit(RoomError(e.toString()));
    }
  }

  Future<void> deleteRooms() async {
    try {
      await DatabaseHelper.deleteRooms();
      emit(DatabaseDeleted());
    } catch (e) {
      emit(RoomError(e.toString()));
    }
  }
}

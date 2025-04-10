import '../models/room_model.dart';
import 'images.dart';


/// Dummy data for demonstration.
List<Room> activeBookings = [
  Room(
      image: AppImages.room_1,
      name: 'Hotel Royal',
      rate: 4.0,
      price: 190,
      tv: true,
      shower: true,
      wifi: false,
      breakfast: false,
      available: true,
      description: 'This is the description',
      images: [AppImages.room_1, AppImages.room_2, AppImages.room_3]),
];

final List<Room> pastBookings = [
  Room(
      image: AppImages.room_1,
      name: 'Sea View Resort',
      rate: 4.2,
      price: 170,
      tv: true,
      shower: true,
      wifi: false,
      breakfast: false,
      available: true,
      description: 'This is the description',
      images: [AppImages.room_1, AppImages.room_2, AppImages.room_3]),
  Room(
    image: AppImages.room_2,
    name: 'Mountain Inn',
    rate: 3.8,
    price: 140,
      tv: true,
      shower: true,
      wifi: false,
      breakfast: false,
      available: true,
      description: 'This is the description',
      images: [AppImages.room_1, AppImages.room_2, AppImages.room_3]
  ),
  Room(
    image: AppImages.room_3,
    name: 'Sea View Resort',
    rate: 4.2,
    price: 170,
      tv: true,
      shower: true,
      wifi: false,
      breakfast: false,
      available: true,
      description: 'This is the description',
      images: [AppImages.room_1, AppImages.room_2, AppImages.room_3]
  ),
  Room(
    image: AppImages.room_4,
    name: 'Mountain Inn',
    rate: 3.8,
    price: 140,
      tv: true,
      shower: true,
      wifi: false,
      breakfast: false,
      available: true,
      description: 'This is the description',
      images: [AppImages.room_1, AppImages.room_2, AppImages.room_3]
  ),
  Room(
    image: AppImages.room_5,
    name: 'Sea View Resort',
    rate: 4.2,
    price: 170,
      tv: true,
      shower: true,
      wifi: false,
      breakfast: false,
      available: true,
      description: 'This is the description',
      images: [AppImages.room_1, AppImages.room_2, AppImages.room_3]
  ),
];
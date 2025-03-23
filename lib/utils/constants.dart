import '../models/booking_item_model.dart';
import 'icons.dart';
import 'images.dart';

/// Dummy data for demonstration.
final List<BookingItemModel> activeBookings = [
  BookingItemModel(
    imagePath: AppImages.room_1,
    hotelName: 'Hotel Royal',
    rating: 4.0,
    price: 190,
    featuresIcons: [
      {'iconPath': AppIcons.tv, 'available': true},
      {'iconPath': AppIcons.shower, 'available': false},
      {'iconPath': AppIcons.wifi, 'available': true},
    ],
    startDate: '2023-10-10',
    endDate: '2023-10-15',
  ),
  // BookingItemModel(
  //   imagePath: 'assets/images/room.jpeg',
  //   hotelName: 'Grand Palace',
  //   rating: 4.5,
  //   price: 220,
  //   featuresIcons: [
  //     {'iconPath': AppIcons.tv, 'available': true},
  //     {'iconPath': AppIcons.shower, 'available': false},
  //     {'iconPath': AppIcons.wifi, 'available': true},
  //   ],
  //   startDate: '2023-11-01',
  //   endDate: '2023-11-05',
  // ),
];

final List<BookingItemModel> pastBookings = [
  BookingItemModel(
    imagePath: AppImages.room_1,
    hotelName: 'Sea View Resort',
    rating: 4.2,
    price: 170,
    featuresIcons: [
      {'iconPath': AppIcons.tv, 'available': true},
      {'iconPath': AppIcons.shower, 'available': false},
      {'iconPath': AppIcons.wifi, 'available': true},
    ],
    startDate: '2023-08-15',
    endDate: '2023-08-20',
  ),
  BookingItemModel(
    imagePath: AppImages.room_2,
    hotelName: 'Mountain Inn',
    rating: 3.8,
    price: 140,
    featuresIcons: [
      {'iconPath': AppIcons.tv, 'available': true},
      {'iconPath': AppIcons.shower, 'available': false},
      {'iconPath': AppIcons.wifi, 'available': true},
    ],
    startDate: '2023-07-05',
    endDate: '2023-07-10',
  ),
  BookingItemModel(
    imagePath: AppImages.room_3,
    hotelName: 'Sea View Resort',
    rating: 4.2,
    price: 170,
    featuresIcons: [
      {'iconPath': AppIcons.tv, 'available': true},
      {'iconPath': AppIcons.shower, 'available': false},
      {'iconPath': AppIcons.wifi, 'available': true},
    ],
    startDate: '2023-08-15',
    endDate: '2023-08-20',
  ),
  BookingItemModel(
    imagePath: AppImages.room_4,
    hotelName: 'Mountain Inn',
    rating: 3.8,
    price: 140,
    featuresIcons: [
      {'iconPath': AppIcons.tv, 'available': true},
      {'iconPath': AppIcons.shower, 'available': false},
      {'iconPath': AppIcons.wifi, 'available': true},
    ],
    startDate: '2023-07-05',
    endDate: '2023-07-10',
  ),
  BookingItemModel(
    imagePath: AppImages.room_5,
    hotelName: 'Sea View Resort',
    rating: 4.2,
    price: 170,
    featuresIcons: [
      {'iconPath': AppIcons.tv, 'available': true},
      {'iconPath': AppIcons.shower, 'available': false},
      {'iconPath': AppIcons.wifi, 'available': true},
    ],
    startDate: '2023-08-15',
    endDate: '2023-08-20',
  ),
];
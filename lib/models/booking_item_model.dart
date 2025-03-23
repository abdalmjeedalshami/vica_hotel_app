/// Model to hold booking item information.
class BookingItemModel {
  final String imagePath;
  final String hotelName;
  final double rating;
  final double price;
  final List<Map<String, dynamic>> featuresIcons;
  final String startDate;
  final String endDate;

  BookingItemModel({
    required this.imagePath,
    required this.hotelName,
    required this.rating,
    required this.price,
    required this.featuresIcons,
    required this.startDate,
    required this.endDate,
  });
}
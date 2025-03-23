import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  final String imageUrl;
  final String roomName;
  final double rating;
  final double price;
  final DateTime bookedDate;

  const RoomWidget({super.key,
    required this.imageUrl,
    required this.roomName,
    required this.rating,
    required this.price,
    required this.bookedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Room details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Room name
                  Text(
                    roomName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Stars Rating
                  Row(
                    children: List.generate(
                      5,
                          (index) => Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Price
                  Text(
                    '\$$price per night',
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  // Booked Date
                  Text(
                    'Booked: ${bookedDate.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Icons (e.g., WiFi, Parking, Air Conditioning)
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi, size: 24, color: Colors.blue),
                Icon(Icons.local_parking, size: 24, color: Colors.blue),
                Icon(Icons.air, size: 24, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

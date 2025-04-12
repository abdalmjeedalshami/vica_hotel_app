import 'package:flutter/material.dart';
import '../models/room_model.dart';

class RoomCard1 extends StatelessWidget {
  final Room room;

  const RoomCard1({Key? key, required this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200, // Fixed width for horizontal scrolling
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(room.image, height: 100, width: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(room.name, style: const TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("\$${room.price.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.green)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(room.rate.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                room.available ? "Available" : "Unavailable",
                style: TextStyle(
                  color: room.available ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

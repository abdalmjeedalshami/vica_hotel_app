import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String content;
  final VoidCallback onEditPressed;

  const InfoCard({super.key,
    required this.iconPath,
    required this.title,
    required this.content,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon
            const Icon(
              Icons.account_circle, // Or use ImageIcon with iconPath if it's a custom image
              size: 40,
              color: Colors.blue,
            ),
            const SizedBox(width: 16),
            // Title and content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Edit Icon
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: onEditPressed,
            ),
          ],
        ),
      ),
    );
  }
}
